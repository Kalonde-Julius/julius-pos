BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "cache" ("key" varchar not null, "value" text not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "cache_locks" ("key" varchar not null, "owner" varchar not null, "expiration" integer not null, primary key ("key"));
CREATE TABLE IF NOT EXISTS "clients" ("id" integer primary key autoincrement not null, "name" varchar not null, "email" varchar not null, "phone" varchar, "address" varchar, "created_at" datetime, "updated_at" datetime);
CREATE TABLE IF NOT EXISTS "failed_jobs" ("id" integer primary key autoincrement not null, "uuid" varchar not null, "connection" text not null, "queue" text not null, "payload" text not null, "exception" text not null, "failed_at" datetime not null default CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS "invoice_items" ("id" integer primary key autoincrement not null, "invoice_id" integer not null, "product_id" integer not null, "unit_price" numeric not null, "quantity" integer not null, "discount" numeric not null default '0', "tax" numeric not null default '0', "subtotal" numeric not null, "total" numeric not null, "created_at" datetime, "updated_at" datetime, foreign key("invoice_id") references "invoices"("id") on delete cascade, foreign key("product_id") references "products"("id") on delete cascade);
CREATE TABLE IF NOT EXISTS "invoices" ("id" integer primary key autoincrement not null, "invoice_number" varchar not null, "client_name" varchar not null, "invoice_date" date not null, "driver" varchar not null, "vehicle" varchar not null, "notes" varchar not null, "grand_total" numeric not null, "created_at" datetime, "updated_at" datetime);
CREATE TABLE IF NOT EXISTS "job_batches" ("id" varchar not null, "name" varchar not null, "total_jobs" integer not null, "pending_jobs" integer not null, "failed_jobs" integer not null, "failed_job_ids" text not null, "options" text, "cancelled_at" integer, "created_at" integer not null, "finished_at" integer, primary key ("id"));
CREATE TABLE IF NOT EXISTS "jobs" ("id" integer primary key autoincrement not null, "queue" varchar not null, "payload" text not null, "attempts" integer not null, "reserved_at" integer, "available_at" integer not null, "created_at" integer not null);
CREATE TABLE IF NOT EXISTS "migrations" ("id" integer primary key autoincrement not null, "migration" varchar not null, "batch" integer not null);
CREATE TABLE IF NOT EXISTS "password_reset_tokens" ("email" varchar not null, "token" varchar not null, "created_at" datetime, primary key ("email"));
CREATE TABLE IF NOT EXISTS "products" ("id" integer primary key autoincrement not null, "name" varchar not null, "description" text, "price" numeric not null, "created_at" datetime, "updated_at" datetime);
CREATE TABLE IF NOT EXISTS "sessions" ("id" varchar not null, "user_id" integer, "ip_address" varchar, "user_agent" text, "payload" text not null, "last_activity" integer not null, primary key ("id"));
CREATE TABLE IF NOT EXISTS "users" ("id" integer primary key autoincrement not null, "name" varchar not null, "email" varchar not null, "email_verified_at" datetime, "password" varchar not null, "remember_token" varchar, "created_at" datetime, "updated_at" datetime);
INSERT INTO "clients" ("id","name","email","phone","address","created_at","updated_at") VALUES (1,'Kalonde','kalonde@julius.com','0704999056','KIKAAYA
KIKAAYA, BULENGA','2026-06-04 18:45:50','2026-06-04 18:45:50'),
 (2,'Kim','kim@julius.com','+254722345345','Thika, Kenya','2026-06-04 19:46:32','2026-06-04 19:46:32'),
 (3,'Mama Njeri','njeri@julius.com','+254722567765','Eldoret, Kenya','2026-06-04 19:47:49','2026-06-04 19:47:49');
INSERT INTO "invoice_items" ("id","invoice_id","product_id","unit_price","quantity","discount","tax","subtotal","total","created_at","updated_at") VALUES (4,1,1,4000,10000,0,0,40000000,40000000,'2026-06-04 19:00:52','2026-06-04 19:00:52'),
 (5,1,2,1850,28000,0,18,51800000,61124000,'2026-06-04 19:00:52','2026-06-04 19:00:52'),
 (6,1,3,1780,12000,0,16,21360000,24777600,'2026-06-04 19:00:52','2026-06-04 19:00:52'),
 (13,2,6,820,12000,0,0,9840000,9840000,'2026-06-04 19:50:18','2026-06-04 19:50:18'),
 (14,2,2,1700,27500,0,18,46750000,55165000,'2026-06-04 19:50:18','2026-06-04 19:50:18'),
 (15,2,3,1730,12000,0,0,20760000,20760000,'2026-06-04 19:50:18','2026-06-04 19:50:18'),
 (17,3,2,1600,28000,0,0,44800000,44800000,'2026-06-08 22:31:42','2026-06-08 22:31:42'),
 (18,3,6,870,12000,0,0,10440000,10440000,'2026-06-08 22:31:42','2026-06-08 22:31:42'),
 (21,4,2,1500,28000,0,0,42000000,42000000,'2026-06-09 08:13:30','2026-06-09 08:13:30'),
 (22,4,6,860,12000,0,0,10320000,10320000,'2026-06-09 08:13:30','2026-06-09 08:13:30'),
 (23,4,3,1700,12000,0,0,20400000,20400000,'2026-06-09 08:13:30','2026-06-09 08:13:30');
INSERT INTO "invoices" ("id","invoice_number","client_name","invoice_date","driver","vehicle","notes","grand_total","created_at","updated_at") VALUES (1,'1','Kalonde','2026-06-04','Billy','KBB 123/ZD 1234','Malaba: Papai +254722124524',125901600,'2026-06-04 18:50:13','2026-06-04 19:00:52'),
 (2,'2','Mama Njeri','2026-06-04','Joshua Ngomo','KCM 223/ ZD 3232','Malaba (Papai): +25672465542',85765000,'2026-06-04 19:16:52','2026-06-04 19:50:18'),
 (3,'3','Kim','2026-06-08','Obed Nakongo','KCD 456/ ZE 8765','Malaba (Omusse) +254722456789',55240000,'2026-06-08 22:30:13','2026-06-08 22:31:42'),
 (4,'4','Mama Njeri','2026-06-09','Joshua','KCM 123/ ZD 23445','Papai: +256704567',72720000,'2026-06-09 08:12:09','2026-06-09 08:13:30');
INSERT INTO "migrations" ("id","migration","batch") VALUES (1,'0001_01_01_000000_create_users_table',1),
 (2,'0001_01_01_000001_create_cache_table',1),
 (3,'0001_01_01_000002_create_jobs_table',1),
 (4,'2025_12_22_125434_create_invoices_table',1),
 (5,'2025_12_22_132500_create_clients_table',1),
 (6,'2025_12_24_134850_create_invoice_items_table',1),
 (7,'2025_12_24_150737_create_products_table',1);
INSERT INTO "products" ("id","name","description","price","created_at","updated_at") VALUES (1,'Beans','Nambaale short/long (export)',4000,'2026-06-04 18:38:40','2026-06-04 18:42:18'),
 (2,'Maize','Air dried + 13% moisture content',1800,'2026-06-04 18:39:14','2026-06-04 18:40:51'),
 (3,'Soya beans','Moisture 13-13.5%',1700,'2026-06-04 18:40:06','2026-06-04 18:40:06'),
 (4,'Coffee','Robusta (graded)',14000,'2026-06-04 18:43:56','2026-06-04 18:43:56'),
 (5,'Rice','super',3800,'2026-06-04 18:44:37','2026-06-04 18:44:37'),
 (6,'Maize germ','Maize germ',800,'2026-06-04 19:42:12','2026-06-04 19:42:12'),
 (7,'apples','green',1000,'2026-06-09 08:08:58','2026-06-09 08:08:58');
INSERT INTO "users" ("id","name","email","email_verified_at","password","remember_token","created_at","updated_at") VALUES (1,'Julius','julius@julius.com',NULL,'$2y$12$8isMHdC7RxvxOCoB882z3.d6dC4vbCk2syVS.FEusVPmMsEv.NbUq',NULL,'2026-06-04 18:36:49','2026-06-04 18:36:49');
CREATE UNIQUE INDEX "clients_email_unique" on "clients" ("email");
CREATE UNIQUE INDEX "failed_jobs_uuid_unique" on "failed_jobs" ("uuid");
CREATE UNIQUE INDEX "invoices_invoice_number_unique" on "invoices" ("invoice_number");
CREATE INDEX "jobs_queue_index" on "jobs" ("queue");
CREATE INDEX "sessions_last_activity_index" on "sessions" ("last_activity");
CREATE INDEX "sessions_user_id_index" on "sessions" ("user_id");
CREATE UNIQUE INDEX "users_email_unique" on "users" ("email");
COMMIT;
