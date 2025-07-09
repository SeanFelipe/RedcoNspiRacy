require_relative 'java_imports'
require_relative 'zredc'

configuration = Lwjgl3ApplicationConfiguration.new
configuration.title = 'RedC'
#motox = 720
ten80 = 1080 / 3
#new_feb = 400
#$worldx = ten80
#$worldy = $worldx * 1.7777
$worldx = 800
$worldy = 600
$scale = 1
#configuration.width = $worldx / $scale
#configuration.height = $worldy / $scale  # 16:9 aspect ratio
#configuration.height = configuration.width * 1.644  # Gdx.graphics.getWidth motox getHeight from the phone is 720, 1184
configuration.resizable = true

$redc = MainGame.new
Lwjgl3Application.new($redc, configuration)
