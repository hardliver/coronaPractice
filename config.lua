--
-- application =
-- {
-- 	content =
-- 	{
-- 		fps = 60,
-- 		width = 320,
-- 		height = 480,
-- 		scale = "letterbox",
-- 		xAlign = "center",
-- 		yAlign = "center",
--
-- 		imageSuffix =
-- 		{
-- 			["@2x"] = 2.000,
-- 			["@4x"] = 4.000
-- 		}
-- 	}
-- }


application =
{
	content =
	{
		width = 960,
		height = 960 * display.pixelHeight / display.pixelWidth,
   		scale = "letterbox",
		fps = 60
	},
}
