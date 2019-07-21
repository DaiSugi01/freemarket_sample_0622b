-- マスターデータの挿入用SQL
INSERT INTO `mst_delivery_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, '未定', NOW(), NOW()),
	(2, 'らくらくメルカリ便', NOW(), NOW()),
	(3, 'ゆうメール', NOW(), NOW()),
	(4, 'レターパック', NOW(), NOW()),
	(5, '普通郵便(定形、定形外)', NOW(), NOW()),
	(6, 'クロネコヤマト', NOW(), NOW()),
	(7, 'ゆうパック', NOW(), NOW()),
	(8, 'クリックポスト', NOW(), NOW()),
	(9, 'ゆうパケット', NOW(), NOW());
