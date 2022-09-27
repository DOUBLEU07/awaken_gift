Config = {}

---  สถานที่ในแผนที่
Config.Santa = {
	gift = {coords = vector3(-4983.64990234375, -3858.77001953125, 2051.550048828125)},   -- สำหรับ Event กดเพื่อรับของ

	}

--- กำหนดข้อความ บน NPC -4983.64990234375, -3858.77001953125, 2051.550048828125
Config.X = -4983.64
Config.Y = -3858.77
Config.Z =  2051.55

--- กำหนด Ped
Config.Fonts = 'font4thai'

--- กำหนด Item กิจกรรม
Config.Item1 = "gacha_firstcar"
Config.Item1Amount = 1

Config.Item2 = "food_dish"
Config.Item2Amount = 2


Config.Item3 = "food_box"
Config.Item3Amount = 2

Config.Item5 = "jobcard"
Config.Item5Amount =1

Config.Item6 = "reskin_card"
Config.Item6Amount = 1

Config.Item7 = "newplayer_box"
Config.Item7Amount = 1

Config.Item8 = "carnewplayer"
Config.Item8Amount = 1

Config.Item9 = "key_safe5day_box"
Config.Item9Amount = 1


Config.Npc = {
	Npc = {
		coords = vector3(-4983.64990234375, -3858.77001953125, 2051.550048828125),	-- พิกัดของตัว NPC
		NPC = {
			Model = "mp_f_freemode_01",				-- Model ของ NPC # จะใส่เป็น mp_m_freemode_01 หรือ mp_f_freemode_01 ก็ได้
			heading = 88.52,						-- จะให้ NPC หันไปทางไหน
			Animation = { -- ใส่ท่าทางให้ NPC
				Scenario = false,
				AnimationDirect = "divined@dancesv2@new",
				AnimationScene = "divdance1",
			},-- {"arms_2":0,"blush_3":0,"blush_1":3,"eyebrows_3":0,"sun_2":0,"watches_2":0,"lipstick_4":0,"complexion_1":5,
			Cloth = { 
				face1 =                      31       ,        --   หน้าตา
				skin =                       21       ,        --   สีผิว
				wrinkles =                   0       ,        --   ริ้วรอย
				wrinkle_thickness =          0       ,        --   ความหนาของริ้วรอย
				beard_1 =                    0       ,        --   เครา
				beard_2 =                    0       ,        --   ขนาดเครา
				beard_3 =                    0       ,        --   สีเครา 1
				beard_4 =                    0       ,        --   สีเครา 2
				hair_1 =                     11       ,        --   ทรงผม 1
				hair_2 =                     0       ,        --   ทรงผม 2
				hair_color_1 =               15       ,        --   สีผม 1
				hair_color_2 =               15       ,        --   สีผม 2
				eye_color =                  12       ,        --   สีตา
				eyebrow_type =               23       ,        --   คิ้ว
				eyebrow_size =               8       ,        --   ขนาดคิ้ว
				eyebrow_color_1 =            0       ,        --   สีคิ้ว 1
				eyebrow_color_2 =            0       ,        --   สีคิ้ว 2
				makeup_type =                0       ,        --   เมคอัพ
				makeup_thickness =           0       ,        --   ความหนาเมคอัพ
				makeup_color_1 =             0       ,        --   สีเมคอัพ 1
				makeup_color_2 =             0       ,        --   สีเมคอัพ 2
				lipstick_type =              0       ,        --   ลิปสติก
				lipstick_thickness =         5       ,        --   ความหนาลิปสติก
				lipstick_color_1 =           53      ,        --   สีลิปสติก 1
				lipstick_color_2 =           5       ,        --   สีลิปสติก 2
				ears_1 =                     12       ,        --   อุปกรณ์เสริมหู
				ears_2 =                     0       ,        --   สีอุปกรณ์เสริมหู
				tshirt_1 =                   106      ,        --   เสื้อด้านใน
				tshirt_2 =                   0       ,        --   สีเสื้อด้านใน
				torso_1 =                    17       ,        --   เสื้อนอก
				torso_2 =                    0       ,        --   สีเสื้อนอก
				decals_1 =                   0       ,        --   สติ๊กเกอร์ 1
				decals_2 =                   0       ,        --   สติ๊กเกอร์ 2
				arms =                       6       ,        --   แขน/ถุงมือ
				arms_2 =                     0       ,        --   สีถุงมือ
				pants_1 =                    139       ,        --   กางเกง                                    
				pants_2 =                    2       ,        --   สีกางเกง
				shoes_1 =                    63       ,        --   รองเท้า
				shoes_2 =                    7       ,        --   สีรองเท้า
				mask_1 =                     0       ,        --   หน้ากาก
				mask_2 =                     0       ,        --   สีหน้ากาก
				bproof_1 =                   0       ,        --   เสื้อเกาะ
				bproof_2 =                   0       ,        --   สีเสื้อเกาะ
				chain_1 =                    11       ,        --   สร้อยคอ
				chain_2 =                    0       ,        --   ขนหน้าอก
				helmet_1 =                   -1       ,        --   หมวก
				helmet_2 =                   0       ,        --   สีหมวก
				watches_1 =                  22       ,        --   นาฬิกาข้อมือ
				watches_2 =                  0       ,        --   สีนาฬิกาข้อมือ
				bracelets_1 =                0       ,        --   กุญแจมือ 1
				bracelets_2 =                0       ,        --   กุญแจมือ 2
				glasses_1 =                  16       ,        --   แว่น 1
				glasses_2 =                  0       ,        --   แว่น 2
				bags_1 =                     0       ,        --   กระเป๋า
				bags_2 =                     0       ,        --   สีกระเป๋า
				blemishes =                  0       ,        --   สิว
				blemishes_size=              0       ,        --   ความหนาของสิว
				ageing =                     0       ,        --   ริ้วรอย
				ageing_1 =                   0       ,        --   ความหนาของริ้วรอย
				blush =                      3       ,        --   หน้าแดง
				blush_1 =                    5       ,        --   บลัชออนหนา
				blush_color =                0       ,        --   สีบลัช
				complexion =                 10       ,        --   ผิว
				complexion_1 =               5       ,        --   ความหนาของผิว
				sun =                        0       ,        --   หน้าหมองคล่ำ
				sun_1 =                      0       ,        --   ความหนาหน้าหมองคล่ำ
				freckles =                   0       ,        --   freckles
				freckles_1 =                 0       ,        --   freckles thickness
				chest_hair =                 0       ,        --   ขนหน้าอก
				chest_hair_1 =               0       ,        --   หน้าอกผมหนา
				chest_color =                0       ,        --   สีขน
				bodyb =                      0       ,        --   ร่างกายเป็นสิว
				bodyb_size =                 0       ,        --   ความหนาของร่างกายทำให้เป็นสิว
			}
		},
	},
}