-- マスターデータの挿入用SQL
INSERT INTO `mst_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, '出品中', NOW(), NOW()),
	(2, '取引中', NOW(), NOW()),
	(3, '売却済み', NOW(), NOW());
