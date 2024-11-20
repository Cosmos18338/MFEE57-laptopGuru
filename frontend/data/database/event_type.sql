-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-11-20 13:58:08
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `guru`
--

-- --------------------------------------------------------

--
-- 資料表結構 `event_type`
--

CREATE TABLE `event_type` (
  `event_id` int(5) NOT NULL,
  `event_name` varchar(50) NOT NULL,
  `event_type` varchar(20) NOT NULL,
  `event_platform` varchar(20) NOT NULL,
  `event_content` text NOT NULL,
  `event_rule` text NOT NULL,
  `event_award` text NOT NULL,
  `individual_or_team` enum('個人','團體') NOT NULL DEFAULT '個人' COMMENT '比賽類型：個人或團體賽',
  `event_picture` varchar(255) NOT NULL,
  `apply_start_time` datetime NOT NULL,
  `apply_end_time` datetime NOT NULL,
  `event_start_time` datetime NOT NULL,
  `event_end_time` datetime NOT NULL,
  `maximum_people` int(3) NOT NULL,
  `status_id` int(2) DEFAULT 1,
  `valid` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `current_participants` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `event_type`
--

INSERT INTO `event_type` (`event_id`, `event_name`, `event_type`, `event_platform`, `event_content`, `event_rule`, `event_award`, `individual_or_team`, `event_picture`, `apply_start_time`, `apply_end_time`, `event_start_time`, `event_end_time`, `maximum_people`, `status_id`, `valid`, `created_at`, `current_participants`) VALUES
(1, 'APEX - INTOVOID娛樂賽', 'Apex Legends', 'PC', 'INTOVOID娛樂賽 SDLP Community主辦的第四届娛樂賽,開放給各位玩家報名', '1. 需按時完成報到\n2. 禁止使用任何外掛或輔助工具\n3. 遵守遊戲官方規則\n4. 禁止隊伍間共謀行為\n5. 直播延遲需設定2分鐘', '冠軍：新台幣30,000元 + 獎盃\n亞軍：新台幣15,000元\n季軍：新台幣10,000元\nMVP：新台幣5,000元', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/13962/banner_image.png?cf0PXmkEIHXBnOSL_mgr2A==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2025-01-02 00:00:00', 60, 1, 1, '0000-00-00 00:00:00', 3),
(2, 'G-EIGHT《Just Dance 舞力全開 2023》舞王挑戰賽', 'Just Dance', 'Switch', '台灣玩家專屬的遊戲展,在舞台上展現律動,尋找最強舞王', '採最速報名制;需在現場報到參賽', '季軍：新台幣20,000元 + 獎狀', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14247/banner_image.jpg?ZmvN1TeWfzH8MtsQXaz8Vw==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-14 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 5),
(3, '娜迪亞《鬥陣特攻2》冬季盃2023 (Nadiya Cup Winter 2023)', 'Overwatch 2', 'PC', '娜迪亞主辦的《鬥陣特攻2》冬季盃2023賽事', '採最速報名制;需在現場報到參賽', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14264/banner_image.png?da7E9qoxKweGYEs8BmYqTQ==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-19 00:00:00', 16, 1, 1, '0000-00-00 00:00:00', 3),
(4, '《Just Dance 舞力全開 2023》TGS娛樂賽', 'Just Dance', 'Switch', '2023台北國際電玩展上最活力四射的電競盛事', '需在台北電玩展現場參加;遵守舞台表演規則', '季軍：新台幣20,000元 + 獎狀', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14411/banner_image.jpg?kWX0IfQKJmyi43oiQAFgDg==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-19 00:00:00', 21, 1, 1, '0000-00-00 00:00:00', 0),
(5, '《Just Dance 舞力全開 2023》TGS娛樂賽【複賽】', 'Just Dance', 'Switch', '2023台北國際電玩展上最活力四射的電競盛事！\n\n燃燒你的熱情！燃燒你的靈魂！將你沸騰的能量用熱舞迸射出來！\n\n來吧！站上這個絢麗的舞台，讓眾人為你的舞技心醉神迷！\n\n「《Just Dance 舞力全開 2023》TGS娛樂賽」就在「台北國際電玩展」，一起來秀吧！', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14411/banner_image.jpg?kWX0IfQKJmyi43oiQAFgDg==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2024-12-31 00:00:00', 21, 1, 1, '0000-00-00 00:00:00', 2),
(6, '《Just Dance 舞力全開 2023》TGS娛樂賽【決賽】', 'Just Dance', 'Switch', '2023台北國際電玩展上最活力四射的電競盛事！\n\n燃燒你的熱情！燃燒你的靈魂！將你沸騰的能量用熱舞迸射出來！\n\n來吧！站上這個絢麗的舞台，讓眾人為你的舞技心醉神迷！\n\n「《Just Dance 舞力全開 2023》TGS娛樂賽」就在「台北國際電玩展」，一起來秀吧！', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14472/banner_image.jpg?MD3ZllTGchEgYZTtL7qUOg==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-15 00:00:00', 21, 1, 1, '0000-00-00 00:00:00', 4),
(7, 'The Updraft W2 Powered by PLANET9', 'Valorant', 'PC', '協助發展東南亞競技社群,為未能進入VCT的隊伍提供比賽機會', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '參加獎：精美禮品', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14319/banner_image.jpg?UNWIjJGuMAcJWUDcSXajkQ==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-20 00:00:00', 16, 1, 1, '0000-00-00 00:00:00', 3),
(8, 'AfreecaTV Mastiff League Season 2 - Apex Legends', 'Apex Legends', 'PC', '這次比賽由AfreecaTV主辦的Apex Legends比賽，名為 AfreecaTV Mastiff League。簡稱「AML」。本季為第二季，勝出的隊伍會成為第三季的種子隊伍。\n\n「AfreecaTV」為韓國其中一個最大的網絡直播平台，目前服務已推廣至台灣、泰國、越南、日本及美國香港分公司於2015年成立，主以合作及提供免費直播支援來推廣服務。\n\n近年亦於台港澳地區舉辦不同的電競比賽，推廣地區電競發展。', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '參加獎：精美禮品', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14333/banner_image.jpg?fSws7-f2P0yMnbtgiYKWkA==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-17 00:00:00', 80, 1, 1, '0000-00-00 00:00:00', 0),
(9, 'The Updraft W3 Powered by PLANET9', 'Valorant', 'PC', '輔仁大學資管系與DINOGAMEHOUSE合辦的特戰英豪比賽', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14320/banner_image.jpg?Xip19LsKGhiOgZ3_tLWKcQ==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2024-12-30 00:00:00', 16, 1, 1, '0000-00-00 00:00:00', 3),
(10, 'AOPEN x Fire Legend Championships (素人組)', 'Apex Legends', 'PC', '希望藉由本次競賽促進台灣APEX社群ARENA高端對局的交流，並同時讓平常在段位賽中廝殺的玩家們能有機會來一場刺激的競賽。期望本次活動能讓社群更有參與感並吸引更多玩家加入APEX，建立友善的交流遊玩環境。', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '季軍：新台幣20,000元 + 獎狀', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14331/banner_image.jpg?DZ0saqfudqjCJY7BH44T5Q==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-16 00:00:00', 21, 1, 1, '0000-00-00 00:00:00', 2),
(11, '爬瓦盃 POWER CHAMPION CUP👀', 'Valorant', 'PC', '爬瓦盃是由輔仁大學資管系與DINOGAMEHOUSE一起合辦的特戰英豪比賽\n\n滿15歲以上便可報名(未滿18歲需填家長同意書)\n\n報名費以人頭計算，一個人頭一百元，一隊最少5人最多7人\n\n賽程從3/2開始到3/19，最多招收64隊\n\n本平台只用於賽事報名與流程進行\n\n主要溝通平台為DISCORD\n\n只要參賽就能參與參賽隊伍專屬的抽獎\n\n快來報名拔༼ つ ◕_◕ ༽つ', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14518/banner_image.png?9H9gZ1WynBcE3zhw41R7EA==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-20 00:00:00', 64, 1, 1, '0000-00-00 00:00:00', 2),
(12, 'The Updraft W4 Powered by PLANET9', 'Valorant', 'PC', '輔仁大學資管系與DINOGAMEHOUSE合辦的特戰英豪比賽', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '參加獎：精美禮品', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14321/banner_image.jpg?QgQJmwUOyq0RsTt0rd4CcQ==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-18 00:00:00', 16, 1, 1, '0000-00-00 00:00:00', 0),
(13, 'AfreecaTV TFT The Chosen One TW&HK (S11) 海選賽', 'Teamfight Tactics', 'Mobile/PC', '這次比賽為《AfreecaTV TFT The Chosen One TW&HK》的海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 4月1日14:00 順序進行，積分最高的首8名選手將晉級到邀請賽部份，除爭奪豐富的獎金獎品外，更可獲得進入SEA預賽的資格，挑戰世界賽(Set Championship)的機會！\n\n\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '季軍：新台幣20,000元 + 獎狀', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15089/banner_image.png?HDfZ2HArzHuqyYtljqa0tg==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2025-01-01 00:00:00', 24, 1, 1, '0000-00-00 00:00:00', 3),
(14, '(小組A)AfreecaTV TFT The Chosen One TW&HK (S11) 邀請賽', 'Teamfight Tactics', 'Mobile/PC', '這次比賽為《AfreecaTV TFT The Chosen One TW&HK》的海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 4月1日14:00 順序進行，積分最高的首8名選手將晉級到邀請賽部份，除爭奪豐富的獎金獎品外，更可獲得進入SEA預賽的資格，挑戰世界賽(Set Championship)的機會！\n\n\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '參加獎：精美禮品', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15107/banner_image.png?Dv5LfbHQSzvTv5J1yCZTKA==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-14 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 2),
(15, '(小組B)AfreecaTV TFT The Chosen One TW&HK (S11) 邀請賽', 'Teamfight Tactics', 'Mobile/PC', '這次比賽為《AfreecaTV TFT The Chosen One TW&HK》的海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 4月1日14:00 順序進行，積分最高的首8名選手將晉級到邀請賽部份，除爭奪豐富的獎金獎品外，更可獲得進入SEA預賽的資格，挑戰世界賽(Set Championship)的機會！\n\n\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '季軍：新台幣20,000元 + 獎狀', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15108/banner_image.png?Dv5LfbHQSzvTv5J1yCZTKA==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-20 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 1),
(16, '(敗者組) AfreecaTV TFT The Chosen One TW&HK (S11) 邀請賽', 'Teamfight Tactics', 'Mobile/PC', '這次比賽為《AfreecaTV TFT The Chosen One TW&HK》的海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 4月1日14:00 順序進行，積分最高的首8名選手將晉級到邀請賽部份，除爭奪豐富的獎金獎品外，更可獲得進入SEA預賽的資格，挑戰世界賽(Set Championship)的機會！\n\n\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '亞軍：新台幣30,000元 + 獎牌', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15116/banner_image.png?HeaMFyuHOOG-DMPp4vB9iQ==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-15 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 0),
(17, '(決賽) AfreecaTV TFT The Chosen One TW&HK (S11) 邀請賽', 'Teamfight Tactics', 'Mobile/PC', '這次比賽為《AfreecaTV TFT The Chosen One TW&HK》的海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 4月1日14:00 順序進行，積分最高的首8名選手將晉級到邀請賽部份，除爭奪豐富的獎金獎品外，更可獲得進入SEA預賽的資格，挑戰世界賽(Set Championship)的機會！\n\n\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '亞軍：新台幣30,000元 + 獎牌', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15123/banner_image.png?eAmXyDVEoLdYEC9W9nkhvQ==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2024-12-31 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 3),
(18, '鳳凰盃個人競速賽 - 晉級16強敗部復活賽', 'Kartrider Rush Plus', 'Mobile', '促進跑跑卡丁車手遊發展，並增加玩家對遊戲的熱度、活絡玩家之間的交流，建立賽事平台提供玩家參與。致力於打造最高品質的非官方賽事。', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14487/banner_image.png?1vv5Zypsj6XXGFwDqF9Wfw==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-15 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 2),
(19, '鳳凰盃個人競速賽 - 16強勝者組', 'Kartrider Rush Plus', 'Mobile', '促進跑跑卡丁車手遊發展，並增加玩家對遊戲的熱度、活絡玩家之間的交流，建立賽事平台提供玩家參與。致力於打造最高品質的非官方賽事。', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14488/banner_image.png?1vv5Zypsj6XXGFwDqF9Wfw==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-23 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 4),
(20, '鳳凰盃個人競速賽 - 16強敗者組', 'Kartrider Rush Plus', 'Mobile', '促進跑跑卡丁車手遊發展，並增加玩家對遊戲的熱度、活絡玩家之間的交流，建立賽事平台提供玩家參與。致力於打造最高品質的非官方賽事。', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '季軍：新台幣20,000元 + 獎狀', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14489/banner_image.png?1vv5Zypsj6XXGFwDqF9Wfw==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-16 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 0),
(21, '鳳凰盃個人競速賽 - 晉級決賽復活賽', 'Kartrider Rush Plus', 'Mobile', '促進跑跑卡丁車手遊發展，並增加玩家對遊戲的熱度、活絡玩家之間的交流，建立賽事平台提供玩家參與。致力於打造最高品質的非官方賽事。', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '參加獎：精美禮品', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14490/banner_image.png?1vv5Zypsj6XXGFwDqF9Wfw==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2024-12-31 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 3),
(22, '鳳凰盃個人競速賽 - 決賽SET1', 'Kartrider Rush Plus', 'Mobile', '促進跑跑卡丁車手遊發展，並增加玩家對遊戲的熱度、活絡玩家之間的交流，建立賽事平台提供玩家參與。致力於打造最高品質的非官方賽事。', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '季軍：新台幣20,000元 + 獎狀', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14491/banner_image.png?1vv5Zypsj6XXGFwDqF9Wfw==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-17 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 4),
(23, '鳳凰盃個人競速賽 - 決賽SET2', 'Kartrider Rush Plus', 'Mobile', '促進跑跑卡丁車手遊發展，並增加玩家對遊戲的熱度、活絡玩家之間的交流，建立賽事平台提供玩家參與。致力於打造最高品質的非官方賽事。', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14492/banner_image.png?1vv5Zypsj6XXGFwDqF9Wfw==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-21 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 1),
(24, '2023 北大盃 預賽', 'Arena of Valor', 'Mobile', '為在本校推廣正確之電競運動風氣，配合政府積極推廣電競運動之發展，建立良好的交流管道及領域學習能力，因此本社透過舉辦首屆北大盃，協助大專院校喜好電競運動的學生，建立起相互切磋的賽事平台，藉由本活動讓同學了解電競產業發展概況外，更能從中培養同學間團隊合作的默契、溝通協調與策略應用，提升校際間電子競技運動水準，促進大專院校電子競技運動蓬勃發展。', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14588/banner_image.png?lQCpz7I-1Ao48_LWMMrowg==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-19 00:00:00', 9, 1, 1, '0000-00-00 00:00:00', 0),
(25, '2023 北大盃 複賽', 'Arena of Valor', 'Mobile', '為在本校推廣正確之電競運動風氣，配合政府積極推廣電競運動之發展，建立良好的交流管道及領域學習能力，因此本社透過舉辦首屆北大盃，協助大專院校喜好電競運動的學生，建立起相互切磋的賽事平台，藉由本活動讓同學了解電競產業發展概況外，更能從中培養同學間團隊合作的默契、溝通協調與策略應用，提升校際間電子競技運動水準，促進大專院校電子競技運動蓬勃發展。', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '參加獎：精美禮品', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14592/banner_image.png?dU6A0CMolkf4pyVu1fJKwg==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2024-12-30 00:00:00', 4, 1, 1, '0000-00-00 00:00:00', 4),
(26, 'Apex Legends - THORIUM', 'Apex Legends', 'PC', '本次賽事為大逃殺模式。60隊（180名玩家）,分爲A組，B組與C組互相競爭。每組，20隊，會進行4場賽事來決定隊伍的晉級決賽資格。每組前6名的隊伍會獲得晉級決賽資格，其他遺憾淘汰，而主辦方也會選擇兩隊表現出色但遺憾淘汰的參賽隊伍進行復活，繼續進行決賽。', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15188/banner_image.png?TmxNbw1KV-eDSOXsWT7oLQ==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-17 00:00:00', 60, 1, 1, '0000-00-00 00:00:00', 3),
(27, '第二屆LMI特戰英豪盃 - 超速衝點', 'Valorant', 'PC', '遊戲版本: 採用特戰英豪(Valorant)的現有版本，如有新角色、新地圖在兩 周內發布於正式伺服器當中，則禁止使用。\n\n(例如:角色 A 是在 02 月 05 日 發布的，故角色 A 在 02 月 19 日以前，都不能做使用)。\n\n遊戲模式: 超速衝點、輻能搶攻戰。(此報名區為超速衝點，想要輻能搶攻戰的同學可以至LMI官網點擊輻能搶攻戰報名)\n\n特殊玩法: 所有的對戰回合數皆有禁用角色、禁用地圖環節，前期全體線上約戰由主辦方抽選指定單淘汰比賽地圖與禁用角色。', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '季軍：新台幣20,000元 + 獎狀', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15155/banner_image.jpg?yNPIpQomcUZtPqUMSubcgg==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-22 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 0),
(28, '第二屆LMI特戰英豪盃 - 輻能搶攻戰', 'Valorant', 'PC', '遊戲版本: 採用特戰英豪(Valorant)的現有版本，如有新角色、新地圖在兩 周內發布於正式伺服器當中，則禁止使用。\n\n(例如:角色 A 是在 02 月 05 日 發布的，故角色 A 在 02 月 19 日以前，都不能做使用)。\n\n遊戲模式: 超速衝點、輻能搶攻戰。(此報名區為超速衝點，想要輻能搶攻戰的同學可以至LMI官網點擊輻能搶攻戰報名)\n\n特殊玩法: 所有的對戰回合數皆有禁用角色、禁用地圖環節，前期全體線上約戰由主辦方抽選指定單淘汰比賽地圖與禁用角色。', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15154/banner_image.jpg?yNPIpQomcUZtPqUMSubcgg==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-17 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 0),
(29, '(小組A ) AfreecaTV TFT The Chosen One TW&HK (S12) 邀請', 'Teamfight Tactics', 'Mobile/PC', '這次《The Chosen One S12》為Riot Games授權的台港澳熱身賽事，邀請賽將於7月31日 19:30分 進行，積分最高的首8名選手將晉級到邀請賽部份爭奪豐富的獎金獎品。把握與邀請賽選手對弈的機會，萬勿錯過！\n\n希望和戰棋界名人切磋棋藝的話，就不能錯過我們的系列賽！', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '參加獎：精美禮品', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15344/banner_image.png?LcglKj-o0Fv_FnnWhS_NJg==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2025-01-02 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 2),
(30, '2023北科e-Sports超級聯賽', 'League of Legends', 'PC', '2023北科e-Sports超級聯賽是北科電競社每年都會舉行的盛大活動，今年已邁入了第八屆，本聯賽的目的是為了打造一個讓喜歡遊戲的玩家、對電競有熱情的玩家、甚至是沒碰過遊戲的觀眾都可以一同加入、 一同熱血的舞台，歡迎加入我們的盛會。', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/14535/banner_image.jpg?uNFQGdU8JVg1QkAQEnZvrQ==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-15 00:00:00', 64, 1, 1, '0000-00-00 00:00:00', 3),
(31, '(小組B ) AfreecaTV TFT The Chosen One TW&HK (S12) 邀請', 'Teamfight Tactics', 'Mobile/PC', '這次《The Chosen One S12》為Riot Games授權的台港澳熱身賽事，邀請賽將於7月31日 19:30分 進行，積分最高的首8名選手將晉級到邀請賽部份爭奪豐富的獎金獎品。把握與邀請賽選手對弈的機會，萬勿錯過！\n\n希望和戰棋界名人切磋棋藝的話，就不能錯過我們的系列賽！', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '亞軍：新台幣30,000元 + 獎牌', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15345/banner_image.png?LcglKj-o0Fv_FnnWhS_NJg==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-20 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 2),
(32, '(敗者組 ) AfreecaTV TFT The Chosen One TW&HK (S12) 邀請', 'Teamfight Tactics', 'Mobile/PC', '這次《The Chosen One S12》為Riot Games授權的台港澳熱身賽事，邀請賽將於7月31日 19:30分 進行，積分最高的首8名選手將晉級到邀請賽部份爭奪豐富的獎金獎品。把握與邀請賽選手對弈的機會，萬勿錯過！\n\n希望和戰棋界名人切磋棋藝的話，就不能錯過我們的系列賽！', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '參加獎：精美禮品', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15345/banner_image.png?LcglKj-o0Fv_FnnWhS_NJg==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-16 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 0),
(33, '(決賽 ) AfreecaTV TFT The Chosen One TW&HK (S12) 邀請賽', 'Teamfight Tactics', 'Mobile/PC', '這次《The Chosen One S12》為Riot Games授權的台港澳熱身賽事，邀請賽將於7月31日 19:30分 進行，積分最高的首8名選手將晉級到邀請賽部份爭奪豐富的獎金獎品。把握與邀請賽選手對弈的機會，萬勿錯過！\n\n希望和戰棋界名人切磋棋藝的話，就不能錯過我們的系列賽！', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '亞軍：新台幣30,000元 + 獎牌', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15348/banner_image.png?4UTXE-BEXaAE4QVpTZQ1Ww==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2025-01-01 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 1),
(34, '2023專瓦盃', 'Valorant', 'PC', '《2023專瓦盃》自即日起開放報名 你是熱愛《特戰英豪》的玩家嗎？\n\n誠摯邀請各路好手齊聚專瓦盃切磋槍法\n\n今年10月不能錯過的戰役 報名到9月30日截止\n\n獎金池總價值更是超過20000新台幣！\n\n快和朋友組隊參賽贏豐厚獎品！\n\n2023專瓦盃由新北電競基地學員籌辦 希望能透過交流讓更多朋友體會《特戰英豪》的魅力\n\n比賽分為線上預賽與線下決賽 皆採BO3淘汰制\n\n線上預賽：10月2日至10月6日\n\n線下決賽：10月8日於新北電競基地舉行\n\n決賽當日特別邀請到知名KOL到現場與大家同樂 另外有轉盤團隊死鬥、假聲音超速衝點、雙人兩手警長對決等表演賽不容錯過\n\n現場觀眾還可參加抽獎拿好禮 精采對決、有趣的表演賽以及豐富好禮等待各位來解鎖！', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/gm/ss/Valorant(Theme)%20(Zh).jpg?Sg9sVNlRxNsyiwr4d8uefg==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-17 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 2),
(35, '2023長佳電競盃-新店區域賽', 'EGGY PARTY', 'Mobile', '電競也可以是很歡樂的！\n\n化身可可愛愛的蛋仔，奔跑、跳躍、翻滾、碰撞～\n\n在歡樂的派對中，你能不能脫穎而出成為奪冠者？\n\n\n\n滾進圓宇宙，潮遊新節奏\n\n來吧！跟我們共赴一場歡樂的電競派對～\n\n\n\n長佳機電於2021年首次進軍電競領域表現亮眼，今年仍持續推展電子競技運動；2023第三屆《長佳機電運動場館電競聯賽》由新北市新店、板橋，以及台北市中正、大安、桃園市蘆竹等五館國民運動中心跨區聯合舉辦電競聯賽，並特別規劃各中心限定報名優惠及現場宣傳活動，以推廣電子競技運動普及化，並達到宣導電子競技為健康體育交流之理念。\n\n\n\n在《蛋仔派對》中，玩家將化身成可愛的蛋仔挑戰各種奇妙的關卡。從滾動加速、突破障礙到收集道具，各種關卡充滿了挑戰和樂趣，讓玩家可以感受到不同凡響的遊戲體驗！', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '冠軍：新台幣50,000元 + 獎盃', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15587/banner_image.jpg?VXsuXLnWPtonTQuNbJ1dfA==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-19 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 3),
(36, '2023長佳電競盃-大安和平區域賽', 'EGGY PARTY', 'Mobile', '電競也可以是很歡樂的！\n\n化身可可愛愛的蛋仔，奔跑、跳躍、翻滾、碰撞～\n\n在歡樂的派對中，你能不能脫穎而出成為奪冠者？\n\n\n\n滾進圓宇宙，潮遊新節奏\n\n來吧！跟我們共赴一場歡樂的電競派對～\n\n\n\n長佳機電於2021年首次進軍電競領域表現亮眼，今年仍持續推展電子競技運動；2023第三屆《長佳機電運動場館電競聯賽》由新北市新店、板橋，以及台北市中正、大安、桃園市蘆竹等五館國民運動中心跨區聯合舉辦電競聯賽，並特別規劃各中心限定報名優惠及現場宣傳活動，以推廣電子競技運動普及化，並達到宣導電子競技為健康體育交流之理念。\n\n\n\n在《蛋仔派對》中，玩家將化身成可愛的蛋仔挑戰各種奇妙的關卡。從滾動加速、突破障礙到收集道具，各種關卡充滿了挑戰和樂趣，讓玩家可以感受到不同凡響的遊戲體驗！', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '參加獎：精美禮品', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15604/banner_image.jpg?iGGIcLc0FUOzvGoKP1RHGg==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-17 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 0),
(37, '2023長佳電競盃-板橋區域賽', 'EGGY PARTY', 'Mobile', '電競也可以是很歡樂的！\n\n化身可可愛愛的蛋仔，奔跑、跳躍、翻滾、碰撞～\n\n在歡樂的派對中，你能不能脫穎而出成為奪冠者？\n\n\n\n滾進圓宇宙，潮遊新節奏\n\n來吧！跟我們共赴一場歡樂的電競派對～\n\n\n\n長佳機電於2021年首次進軍電競領域表現亮眼，今年仍持續推展電子競技運動；2023第三屆《長佳機電運動場館電競聯賽》由新北市新店、板橋，以及台北市中正、大安、桃園市蘆竹等五館國民運動中心跨區聯合舉辦電競聯賽，並特別規劃各中心限定報名優惠及現場宣傳活動，以推廣電子競技運動普及化，並達到宣導電子競技為健康體育交流之理念。\n\n\n\n在《蛋仔派對》中，玩家將化身成可愛的蛋仔挑戰各種奇妙的關卡。從滾動加速、突破障礙到收集道具，各種關卡充滿了挑戰和樂趣，讓玩家可以感受到不同凡響的遊戲體驗！', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '冠軍：新台幣50,000元 + 獎盃', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15605/banner_image.jpg?y4jHltfFWoBwzbd3qv3H4w==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2024-12-31 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 0),
(38, '2023長佳電競盃-中正區域賽', 'EGGY PARTY', 'Mobile', '電競也可以是很歡樂的！\n\n化身可可愛愛的蛋仔，奔跑、跳躍、翻滾、碰撞～\n\n在歡樂的派對中，你能不能脫穎而出成為奪冠者？\n\n\n\n滾進圓宇宙，潮遊新節奏\n\n來吧！跟我們共赴一場歡樂的電競派對～\n\n\n\n長佳機電於2021年首次進軍電競領域表現亮眼，今年仍持續推展電子競技運動；2023第三屆《長佳機電運動場館電競聯賽》由新北市新店、板橋，以及台北市中正、大安、桃園市蘆竹等五館國民運動中心跨區聯合舉辦電競聯賽，並特別規劃各中心限定報名優惠及現場宣傳活動，以推廣電子競技運動普及化，並達到宣導電子競技為健康體育交流之理念。\n\n\n\n在《蛋仔派對》中，玩家將化身成可愛的蛋仔挑戰各種奇妙的關卡。從滾動加速、突破障礙到收集道具，各種關卡充滿了挑戰和樂趣，讓玩家可以感受到不同凡響的遊戲體驗！', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '亞軍：新台幣30,000元 + 獎牌', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15621/banner_image.jpg?b4aA4OlSZLNH0XQVtDXOZg==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-18 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 4),
(39, '2023長佳電競盃-蘆竹區域賽', 'EGGY PARTY', 'Mobile', '電競也可以是很歡樂的！\n\n化身可可愛愛的蛋仔，奔跑、跳躍、翻滾、碰撞～\n\n在歡樂的派對中，你能不能脫穎而出成為奪冠者？\n\n\n\n滾進圓宇宙，潮遊新節奏\n\n來吧！跟我們共赴一場歡樂的電競派對～\n\n\n\n長佳機電於2021年首次進軍電競領域表現亮眼，今年仍持續推展電子競技運動；2023第三屆《長佳機電運動場館電競聯賽》由新北市新店、板橋，以及台北市中正、大安、桃園市蘆竹等五館國民運動中心跨區聯合舉辦電競聯賽，並特別規劃各中心限定報名優惠及現場宣傳活動，以推廣電子競技運動普及化，並達到宣導電子競技為健康體育交流之理念。\n\n\n\n在《蛋仔派對》中，玩家將化身成可愛的蛋仔挑戰各種奇妙的關卡。從滾動加速、突破障礙到收集道具，各種關卡充滿了挑戰和樂趣，讓玩家可以感受到不同凡響的遊戲體驗！', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '參加獎：精美禮品', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15622/banner_image.jpg?VbbOvt_JAkNcYZKdoSxnFQ==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-23 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 3),
(40, '2023長佳電競盃-外卡賽', 'EGGY PARTY', 'Mobile', '電競也可以是很歡樂的！\n\n化身可可愛愛的蛋仔，奔跑、跳躍、翻滾、碰撞～\n\n在歡樂的派對中，你能不能脫穎而出成為奪冠者？\n\n\n\n滾進圓宇宙，潮遊新節奏\n\n來吧！跟我們共赴一場歡樂的電競派對～\n\n\n\n長佳機電於2021年首次進軍電競領域表現亮眼，今年仍持續推展電子競技運動；2023第三屆《長佳機電運動場館電競聯賽》由新北市新店、板橋，以及台北市中正、大安、桃園市蘆竹等五館國民運動中心跨區聯合舉辦電競聯賽，並特別規劃各中心限定報名優惠及現場宣傳活動，以推廣電子競技運動普及化，並達到宣導電子競技為健康體育交流之理念。\n\n\n\n在《蛋仔派對》中，玩家將化身成可愛的蛋仔挑戰各種奇妙的關卡。從滾動加速、突破障礙到收集道具，各種關卡充滿了挑戰和樂趣，讓玩家可以感受到不同凡響的遊戲體驗！', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '季軍：新台幣20,000元 + 獎狀', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15680/banner_image.jpg?H3Ywie7MTJaTOiweEMuQ5g==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-17 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 0),
(41, '2023長佳電競盃總決賽', 'EGGY PARTY', 'Mobile', '電競也可以是很歡樂的！\n\n化身可可愛愛的蛋仔，奔跑、跳躍、翻滾、碰撞～\n\n在歡樂的派對中，你能不能脫穎而出成為奪冠者？\n\n\n\n滾進圓宇宙，潮遊新節奏\n\n來吧！跟我們共赴一場歡樂的電競派對～\n\n\n\n長佳機電於2021年首次進軍電競領域表現亮眼，今年仍持續推展電子競技運動；2023第三屆《長佳機電運動場館電競聯賽》由新北市新店、板橋，以及台北市中正、大安、桃園市蘆竹等五館國民運動中心跨區聯合舉辦電競聯賽，並特別規劃各中心限定報名優惠及現場宣傳活動，以推廣電子競技運動普及化，並達到宣導電子競技為健康體育交流之理念。\n\n\n\n在《蛋仔派對》中，玩家將化身成可愛的蛋仔挑戰各種奇妙的關卡。從滾動加速、突破障礙到收集道具，各種關卡充滿了挑戰和樂趣，讓玩家可以感受到不同凡響的遊戲體驗！', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '參加獎：精美禮品', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15681/banner_image.jpg?Df3VKbsSB9pQ9GsEGq24Hw==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2024-12-30 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 3),
(42, '決勝！啟動！：四周年巔峰對決', 'Call of Duty Mobile', 'Mobile', '描述\n一、   賽事資訊\n\n\n\n（一） 參賽人數\n\n一隊5人（可多報名1名替補成員）\n\n（二） 報名資格\n\n年滿14歲之台港澳區域民眾\n\n（三） 報名之隊伍數上限\n\n本賽事報名之隊伍數上限為128隊\n\n（四） 參賽獎金\n\n冠   軍：10,000元\n\n亞   軍：5,000元\n\n季 軍：3,000元\n\n殿 軍：2,000元\n\n*每一輪淘汰賽結束後會贈送參賽者虛擬寶物\n\n（五） 賽制說明\n\n賽   制：單淘汰制，線上賽\n\n比賽方式：\n\n1. 賽事全程皆為BO3，率先取得兩勝者獲勝\n\n2. 比賽模式依序為經典爆破、據點爭奪、控制模式\n\n3. 本賽事使用隨機地圖，自訂房設定為：\n\n經典爆破：每回合獲勝分7分、每回合時間120秒\n\n據點爭奪：每回合獲勝分250分、每回合時間600秒\n\n控制模式：每回合獲勝分3分、每回合時間90秒\n\n4. 八強開始須開啟視訊鏡頭進行賽事，畫面得同時露出選手清楚面部及手機設備(螢幕對角尺寸小於7.5吋)\n\n5. 經典爆破模式若進入Deuce階段，至比分20:20時則以優先達到21分者為優勝。', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15637/banner_image.jpg?kci6vKp0S_bpVKqilfjxaA==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-17 00:00:00', 128, 1, 1, '0000-00-00 00:00:00', 3),
(43, 'Razer Gold 社群挑戰賽：荒野亂鬥 FEB', 'Other Game', 'Mobile', '本賽事為RAZER GOLD主辦荒野亂鬥賽事 主要為了促進社群及玩家交流 賽事獎項：\n\n第一名：3000 RAZER GOLD點數\n\n第二名：1500 RAZER GOLD點數\n\n第三名：1200 RAZER GOLD點數\n\n第四名：900 RAZER GOLD點數\n\n*若獲勝者非台灣人，需同意官方將以內部匯率兌換成HKD面額供獲勝者於Razer Gold HK錢包進行消費\n\n主要為了促進社群及玩家交流', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '冠軍：新台幣50,000元 + 獎盃', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15833/banner_image.png?qFiGdd8rOgbXvLLSReEJfA==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-22 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 4),
(44, '決勝冬季盃S5 複賽', 'Call of Duty Mobile', 'Mobile', '《決勝冬季盃S5》即將震撼登場！熱血戰士們，你們準備好了嗎？\n\n\n\n在寒冷的冬季，曾經的榮耀將再度降臨。這不僅是一場比賽，更是戰友共同奮戰的時刻。\n\n你是否渴望再次感受到那份熱血澎湃的激情？是否嚮往聽到觀眾為你歡呼加油的動人瞬間？\n\n\n\n磨練技巧、準備迎戰！只需你的身手矯捷、技藝精湛，就有機會在這場冬季盛事中脫穎而出！\n\n\n\n在這個冬天，我們將再次共同追尋最初的感動，投身於這場冬季的巔峰對決中！\n\n讓我們一同燃燒、一同奮鬥，創造屬於我們的冠軍時刻！', '1. 必須年滿18歲；2. 每隊最多5人；3. 遵守活動現場管理。', '季軍：新台幣20,000元 + 獎狀', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/ss/game_theme_image_placeholder.jpg?gNWq6P4PoXf20um44pyORw==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-15 00:00:00', 4, 1, 1, '0000-00-00 00:00:00', 0),
(45, '漫威：瞬戰超能 社群挑戰賽', 'Other Game', 'PC', '本賽事為RAZER GOLD主辦漫威：瞬戰超能\n\n主要為了促進社群及玩家交流  賽事獎項：\n\n\n\n第一名：3000 RAZER GOLD點數\n\n\n\n第二名：1500 RAZER GOLD點數\n\n\n\n第三名：900 RAZER GOLD點數\n\n\n\n*上述獎項點數為整隊點數\n\n*若獲勝者非台灣人，需同意官方將以內部匯率兌換成HKD面額供獲勝者於Razer Gold HK錢包進行消費', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '季軍：新台幣20,000元 + 獎狀', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15874/banner_image.png?dILm-AFedwC6sTv-nptkhQ==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2025-01-01 00:00:00', 64, 1, 1, '0000-00-00 00:00:00', 1),
(46, '世紀爭霸賽 S1', 'Call of Duty Mobile', 'Mobile', '描述\n世紀爭霸賽 S1 是一場中小型的娛樂賽事 (目前試辦未來將有望長期舉行)\n\n與隊友配合共創佳績 成為決勝時刻M這個手遊世紀中的霸主\n\n還不趕緊呼朋引伴 揪上戰友組成隊伍 爭取屬於您們自己的最高榮耀吧~\n\n( S2起 將改由決勝時刻小道消息主辦 CJTEAM世紀團隊承辦)', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '季軍：新台幣20,000元 + 獎狀', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/15998/banner_image.jpg?yrKH5EtcXuUSKCScisxYWQ==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-15 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 2),
(47, 'CODM王者之戰：單挑挑戰賽 S1', 'Call of Duty Mobile', 'Mobile', '描述\nCODM王者之戰：單挑挑戰賽是一場由RTS戰隊舉辦的個人單挑娛樂賽事\n\n報名日期 : 113年06月01日 ~ 113年06月30日\n\n比賽日期 : 113年07月06日 ~ 113年07月28日\n\n參加對象 : Garena臺港澳伺服器所有玩家\n\n報名方式： PLANET9賽事系統進行報名\n\n競賽辦法：如已發現作弊、惡意使用其他軟件破壞比賽 檢舉發現並將由主辦方確認後給予懲罰\n\n賽事地點 : 線上\n\n賽事主旨 :\n\n推廣CODM多元娛樂賽事，CODM賽事不是只有以往官方舉辦的5 V.S 5賽事，我們希望能推廣更多不同的賽事', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '亞軍：新台幣30,000元 + 獎牌', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/16018/banner_image.png?3umk4xdzoJYeYzkBn7LLTw==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-22 00:00:00', 32, 1, 1, '0000-00-00 00:00:00', 4),
(48, '(邀請賽 GROUP A ) SOOP TFT The Chosen One (S14)', 'Teamfight Tactics', 'Mobile/PC', '全新平台SOOP樹譜正式上架！\n\n《SOOP TFT The Chosen One》也同時轉移到SOOP!!!\n\n\n\n是次海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 8月11日14:00順序進行，積分最高的首8名選手將晉級到邀請賽部份！\n\n\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '季軍：新台幣20,000元 + 獎狀', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/16104/banner_image.png?Hn1NOanMjy6PHwaJuSWGGA==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-16 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 0),
(49, '(邀請賽 GROUP B) SOOP TFT The Chosen One (S14)', 'Teamfight Tactics', 'Mobile/PC', '全新平台SOOP樹譜正式上架！\n\n《SOOP TFT The Chosen One》也同時轉移到SOOP!!!\n\n\n\n是次海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 8月11日14:00順序進行，積分最高的首8名選手將晉級到邀請賽部份！\n\n\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '冠軍：新台幣50,000元 + 獎盃', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/16105/banner_image.png?Hn1NOanMjy6PHwaJuSWGGA==', '2024-11-13 00:00:00', '2024-11-28 00:00:00', '2024-12-28 00:00:00', '2025-01-02 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 3),
(50, 'sparkling boys', 'Free Fire', 'Mobile', 'dont use grenade', '1. 使用官方指定設備；2. 禁止使用輔助工具；3. 禁止辱罵他人。', '參加獎：精美禮品', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/ss/game_theme_image_placeholder.jpg?gNWq6P4PoXf20um44pyORw==', '2024-11-25 00:00:00', '2024-12-13 00:00:00', '2025-01-13 00:00:00', '2025-01-17 00:00:00', 10, 1, 1, '0000-00-00 00:00:00', 2),
(51, '馬娘夏日寶寶盃', 'Pretty Derby', 'Mobile', '比賽-馬娘夏日寶寶盃\n\n夏天出生的馬娘們一同競技的舞台!\n\n成為夏日王者吧\n\n比賽人數上限：64人 \n\n備取：16人 \n\n比賽日期：7/27\n\n報名截止日:7/26 23:59\n\n比賽流程：\n\n18:20 開放正取選手報到\n\n18:40 開放備取選手報到\n\n18:50 結束報到\n\n19:00 開始比賽\n\n23:00 頒獎/點評\n', '1. 需按時完成報到；2. 禁止使用任何外掛工具；3. 遵守遊戲規則。', '參加獎：精美禮品', '個人', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/16085/banner_image.jpg?8Trxp-euvSp3RncWevzb_g==', '2024-10-24 00:00:00', '2024-11-18 00:00:00', '2024-12-18 00:00:00', '2024-12-20 00:00:00', 64, 1, 1, '0000-00-00 00:00:00', 1),
(52, '(邀請賽 敗者組) SOOP TFT The Chosen One (S14)', 'Teamfight Tactics', 'Mobile/PC', '全新平台SOOP樹譜正式上架！\n\n《SOOP TFT The Chosen One》也同時轉移到SOOP!!!\n\n是次海選賽 (第一階段及第二階段)，第一階段及第二階段預賽將於 8月11日14:00順序進行，積分最高的首8名選手將晉級到邀請賽部份！\n\n邀請選手將於稍後公布，希望和戰棋界名人較量的話，就不能錯過我們的系列賽啊！', '1. 現場抽籤決定對戰；2. 勝者晉級；3. 禁止作弊。', '亞軍：新台幣30,000元 + 獎牌', '', 'https://d1k8pxxip4mxx2.cloudfront.net/pub/media/t8t/16110/banner_image.png?gSNtSICPENsPukvw76WKyQ==', '2024-09-24 00:00:00', '2024-10-14 00:00:00', '2024-11-14 00:00:00', '2024-11-16 00:00:00', 8, 1, 1, '0000-00-00 00:00:00', 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `status_id` (`status_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `event_type`
--
ALTER TABLE `event_type`
  MODIFY `event_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `event_type`
--
ALTER TABLE `event_type`
  ADD CONSTRAINT `event_type_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `event_status_type` (`status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
