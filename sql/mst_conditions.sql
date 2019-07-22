-- マスターデータの挿入用SQL
INSERT INTO `mst_conditions` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, '新品、未使用', NOW(), NOW()),
	(2, '未使用に近い', NOW(), NOW()),
	(3, '目立った傷や汚れなし', NOW(), NOW()),
	(4, 'やや傷や汚れあり', NOW(), NOW()),
	(5, '傷や汚れあり', NOW(), NOW()),
	(6, '全体的に状態が悪い', NOW(), NOW());
