-- マスターデータの挿入用SQL
INSERT INTO `mst_burdens` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, '着払い(購入者負担)', NOW(), NOW()),
	(2, '送料込み(出品者負担)', NOW(), NOW());
