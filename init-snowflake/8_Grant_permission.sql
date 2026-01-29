/* 
File: grants_shared_access.sql

Purpose:
- Centralized GRANT statements for shared access between Snowflake users/roles.
- Ensures objects created by one user can be accessed by other users via roles.

Notes:
- This file does NOT create any objects.
- All GRANTs must be executed by a role with sufficient privileges
  (e.g. SECURITYADMIN or object OWNER).
- Changes in this file affect cross-user access control.
*/
