# 📘 CONTRIBUTING

## 1. Cấu trúc thư mục (Repo Structure)

Repo gồm **3 phần chính**:

```text
repo/
├── infra-aws-terraform/
├── analytics-dbt/
└── bi-powerbi/
```

Chi tiết từng phần bên dưới.

### 1.1 `infra-aws-terraform/`

Dùng để tạo hạ tầng AWS bằng Terraform.

```text
infra-aws-terraform/
├── modules/
│   ├── s3/
│   └── iam/
├── envs/
│   ├── dev/
│   └── prod/
└── .github/workflows/terraform.yml
```

#### 📂 `modules/s3/`

* Tạo S3 bucket: versioning, SSE-S3, folder structure
* Output bucket ARN, name

#### 📂 `modules/iam/`

* IAM role cho Snowflake external stage
* IAM policy giới hạn access (least privilege)

#### 📂 `envs/dev | prod`

Mỗi môi trường bao gồm:

* `main.tf`
* `variables.tf`
* `outputs.tf`

→ Import module và cấu hình theo từng môi trường.

#### ⚙️ `.github/workflows/terraform.yml`

CI/CD thực hiện:

* `terraform fmt`
* `terraform validate`
* `terraform plan`
* (Optional) `terraform apply` với manual approval

### 1.2 `analytics-dbt/`

Dự án dbt transform Snowflake từ **Bronze → Silver → Gold**.

```text
analytics-dbt/
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
├── snapshots/
├── seeds/
├── macros/
├── tests/
└── .github/workflows/dbt.yml
```

#### 📂 `models/staging/`

* Mỗi model bắt đầu bằng `stg_`
* Chuẩn hóa schema, convert data types, rename column

#### 📂 `models/intermediate/`

* Business logic chuẩn hóa
* Join dimensions
* Clean rules
* Dùng tiền tố `int_`

#### 📂 `models/marts/`

* Fact table và dimension chuẩn cuối
* Kimball star schema: `fct_` và `dim_`

#### 📂 `snapshots/`

* SCD Type 2 cho dimension (dbt snapshot)

#### 📂 `seeds/`

* Static lookup tables

#### 📂 `macros/`

* Macro incremental, audit logging, utility

#### 📂 `tests/`

* Generic tests & singular tests

#### ⚙️ `.github/workflows/dbt.yml`

CI/CD chạy:

* `dbt deps`
* `dbt build`
* `dbt test`
* `dbt docs generate`
* Xuất artifact lineage

### 1.3 `bi-powerbi/`

Lưu **PBIP (Power BI Project)** hoặc **PBIX** kèm metadata.

```text
bi-powerbi/
├── model/
├── measures/
├── images/
└── .github/workflows/bi.yml
```

#### 📂 `model/`

* PBIP format (khuyến nghị)
* Hoặc PBIX + metadata export (không version tốt bằng PBIP)

#### 📂 `measures/`

File DAX, ví dụ:

* `sales_measures.dax`
* `customer_measures.dax`

→ Lưu measure definitions để version control.

#### 📂 `images/`

* Screenshots dùng trong tài liệu và README

#### ⚙️ `.github/workflows/bi.yml`

* Lint Power BI model
* Export artifact để review
* (Optional) Validate semantic model

---

## 2. Quy tắc đặt tên (Naming Conventions)

### 2.1 Branch Naming

```text
feat/<mô-tả-ngắn>
fix/<mô-tả-ngắn>
chore/<mô-tả-ngắn>
docs/<mô-tả-ngắn>
refactor/<mô-tả-ngắn>
```

**Ví dụ:**

* `feat/terraform-s3-bucket`
* `feat/dbt-silver-orders`
* `feat/bi-semantic-model`
* `fix/dbt-date-parsing`
* `docs/update-architecture-diagram`

---

### 2.2 Naming trong Terraform

* Resource: `aws_s3_bucket.this`
* Variable: `snake_case`
* Module name: `kebab-case`

**Ví dụ:**

```hcl
variable "bucket_name" {}

module "s3_raw" {}

resource "aws_iam_role" "snowflake_role" {}
```

---

### 2.3 Naming trong dbt

#### Tên model

```text
stg_<table>
int_<table>
dim_<entity>
fct_<process>
```

**Ví dụ:**

* `stg_payments`
* `int_orders_clean`
* `dim_customers`
* `fct_sales_daily`

#### Tên column

* `snake_case`
* Không viết tắt khó hiểu

**Ví dụ:**

```text
order_id
customer_key
order_date
sales_amount
```

#### Snapshot

```text
snap_<dimension>
```

---

### 2.4 Naming trong Power BI

#### Measures

* Không viết tắt
* PascalCase
* Prefix theo nhóm (nếu cần)

**Ví dụ:**

```text
Total Sales
Sales YTD
Customer Count
Sales YoY %
```

#### Tables

* PascalCase
* Dùng tên business (không dùng raw/silver/gold)

**Ví dụ:**

```text
Sales
Customers
Date
Products
```

---

## 3. Quy tắc commit — Conventional Commits

Dự án sử dụng chuẩn **Conventional Commits**:
[https://www.conventionalcommits.org/](https://www.conventionalcommits.org/)

### Format

```text
<type>: <short summary>
```

### Type phổ biến

* `feat:` thêm tính năng mới
* `fix:` sửa lỗi
* `docs:` cập nhật tài liệu
* `style:` format, không đổi logic
* `refactor:` thay đổi code không đổi behavior
* `test:` thêm hoặc sửa test
* `chore:` việc vặt, CI/CD

### Ví dụ commit hợp lệ

* `feat: add gold mart for daily sales`
* `fix: correct date parsing in stg_rentals`
* `docs: add dbt architecture diagram`
* `refactor: split terraform modules into s3 and iam`
* `chore: enable terraform plan in CI`

---

## 4. Quy trình Pull Request

### 4.1 Tạo Pull Request

1. Tạo branch theo naming convention
2. Thực hiện thay đổi code
3. Chạy test local (`terraform validate`, `dbt build`)
4. Push branch
5. Mở PR với mô tả:

   * Summary
   * What changed?
   * Screenshots (nếu có)
   * Checklist trước merge

### 4.2 Review Pull Request

Reviewer kiểm tra:

* Code chạy được
* Đúng conventions
* CI pass
* Không ảnh hưởng phần khác

Approve khi:

```text
CI: PASS
Code: OK
Impact: OK
Docs: Updated (nếu cần)
```

### 4.3 Merge Pull Request

Chỉ merge vào `main` khi:

* Có **≥ 2 approvals**
* CI pass
* Commit đã được squash

## 5. CODEOWNERS

Repo khuyến nghị:

```text
@personA @personB
```

Theo thư mục:

```text
/infra-aws-terraform/** @personA @personB
/analytics-dbt/**      @personA @personB
/bi-powerbi/**         @personA @personB
```
