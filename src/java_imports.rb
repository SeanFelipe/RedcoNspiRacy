java_import 'java.util.Timer'
java_import 'java.util.TimerTask'
#
# desktop specific
if ENV.include? 'GDX_LIBS_DIR'
  # we are on desktop ... get the desktop stuffs
  jardir =  ENV['GDX_LIBS_DIR']
  gdx_jars = [
    'gdx.jar',
    'gdx-natives.jar',
    'gdx-freetype.jar',
    'gdx-freetype-natives.jar',
  ]
  gdx_jars.each {|j| require "#{jardir}/#{j}"}

  desktop_jardir = "#{ENV['REDC_HOME']}/libs/desktop"
  desktop_jars = [
    'gdx-backend-lwjgl.jar',
    'gdx-backend-lwjgl-natives.jar',
  ]
  desktop_jars.each {|j| require "#{desktop_jardir}/#{j}"}
  desktop_imports = [
    'backends.lwjgl.LwjglApplication',
    'backends.lwjgl.LwjglApplicationConfiguration',
  ]

  desktop_imports.each do |i|
    java_import "com.badlogic.gdx.#{i}"
  end
end

# everything else
imports = [
  'ApplicationAdapter',
  'Input',
  'InputAdapter',
  #'InputMultiplexer',
  #'InputProcessor',
  'Game',
  'Gdx',
  #'ScreenAdapter',
  'graphics.GL20',
  #'graphics.Texture',
  #'graphics.Color',
  #'graphics.Mesh',
  #'graphics.Pixmap',
  'graphics.Camera',
  #'graphics.OrthographicCamera',
  'graphics.PerspectiveCamera',
  'graphics.VertexAttributes',
  #'graphics.g2d.TextureRegion',
  #'graphics.g2d.Sprite',
  #'graphics.g2d.SpriteBatch',
  #'graphics.g2d.BitmapFont',
  #'graphics.g2d.freetype.FreeTypeFontGenerator',
  'graphics.g3d.Environment',
  'graphics.g3d.Material',
  'graphics.g3d.Model',
  'graphics.g3d.ModelBatch',
  'graphics.g3d.ModelInstance',
  'graphics.g3d.Renderable',
  'graphics.g3d.Shader',
  'graphics.g3d.attributes.ColorAttribute',
  'graphics.g3d.environment.DirectionalLight',
  'graphics.g3d.environment.PointLight',
  'graphics.g3d.loader.G3dModelLoader',
  'graphics.g3d.utils.CameraInputController',
  'graphics.g3d.utils.ModelBuilder',
  'graphics.g3d.utils.RenderContext',
  'graphics.glutils.ShaderProgram',
  'graphics.glutils.ShapeRenderer',
  'math.MathUtils',
  #'math.Quaternion',
  #'math.Vector2',
  #'math.Vector3',
  #'utils.Align',
  #'utils.TimeUtils',
  #'utils.UBJsonReader',
  #'utils.viewport.ScreenViewport',
  #'utils.viewport.FitViewport',
]

imports.each do |i|
  java_import "com.badlogic.gdx.#{i}"
end

GdxArray = com::badlogic::gdx::utils::Array
