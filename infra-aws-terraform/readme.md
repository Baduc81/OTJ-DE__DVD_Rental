```
S3 Bucket: dvd-rental-ducpb7-tuantd24
│
├── tf_backend/
│   └── terraform.tfstate      ← remote Terraform state
│
└── data/
    └── (file dữ liệu)
```

---

# PHẦN 1 — BOOTSTRAP BACKEND (TẠO CHỖ LƯU STATE)

### PHẦN 1 LÀM GÌ?

* Tạo **S3 bucket**
* Ban đầu **chưa có backend**, nên **dùng local state**
* Sau đó **đẩy state của chính bucket lên S3**
* Phần này **chỉ làm 1 lần duy nhất**

### FILE `main.tf`

**`tf-backend-bootstrap/main.tf`**

```hcl
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "backend" {
  bucket = "dvd-rental-ducpb7-tuantd24"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Terraform Backend Bucket"
  }
}
```

📌 **Giải thích ngắn gọn**

* `terraform {}`: khai báo Terraform + provider
* `provider "aws"`: chỉ định region
* `aws_s3_bucket.backend`: **tạo bucket backend**
* `prevent_destroy`: tránh xóa nhầm backend

---

### CHẠY LỆNH (STATE ĐANG LOCAL)

```bash
cd tf-backend-bootstrap
terraform init
terraform apply
```

Kết quả:

* Bucket **được tạo**
* State nằm **local** (`terraform.tfstate`)

### CHUYỂN STATE LÊN S3 (`tf_backend/`)

#### SỬA LẠI FILE `main.tf`

**`tf-backend-bootstrap/main.tf`** (thêm backend)

```hcl
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28"
    }
  }

  backend "s3" {
    bucket       = "dvd-rental-ducpb7-tuantd24"
    key          = "tf_backend/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
```

📌 **Lưu ý**

* `key = "tf_backend/terraform.tfstate"`
  → tạo **prefix `tf_backend/` trong bucket**

### MIGRATE STATE

```bash
terraform init -migrate-state
```

Khi được hỏi:

```
Do you want to copy existing state to the new backend?
```

👉 gõ `yes`

Kết quả:

```
s3://dvd-rental-ducpb7-tuantd24/tf_backend/terraform.tfstate
```

---

# PHẦN 2 — PROJECT CHÍNH (TẠO DATA)

### PHẦN 2 LÀM GÌ?

* **Dùng bucket ở phần 1 làm backend**
* Tạo thư mục `data/` trong bucket
* Mọi state **đều nằm remote**


### FILE `main.tf`

**`dvd-rental-infra/main.tf`**

```hcl
terraform {
  required_version = ">= 1.6.0"

  backend "s3" {
    bucket       = "dvd-rental-ducpb7-tuantd24"
    key          = "tf_backend/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.28"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
```

📌 **Giải thích**

* Không tạo bucket nữa
* Chỉ **dùng backend đã tồn tại**

### TẠO `data/` TRONG BUCKET

**Thêm vào `main.tf`**

```hcl
resource "aws_s3_object" "data_folder" {
  bucket = "dvd-rental-ducpb7-tuantd24"
  key    = "data/"
}
```

(Optional) file mẫu:

```hcl
resource "aws_s3_object" "sample_data" {
  bucket  = "dvd-rental-ducpb7-tuantd24"
  key     = "data/sample.txt"
  content = "hello data"
}
```

### CHẠY LỆNH

```bash
cd dvd-rental-infra
terraform init
terraform apply
```