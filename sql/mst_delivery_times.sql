-- マスターデータの挿入用SQL
INSERT INTO `mst_delivery_times` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, '1~2日で発送', NOW(), NOW()),
	(2, '2~3日で発送', NOW(), NOW()),
	(3, '4~7日で発送', NOW(), NOW());
