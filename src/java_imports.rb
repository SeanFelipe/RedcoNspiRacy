java_import 'java.util.Timer'
java_import 'java.util.TimerTask'
#

jardir =  './libs'
gdx_jars = [
  'gdx-1.13.5.jar',
  'gdx-jnigen-loader-2.5.2.jar',
  #'gdx-natives.jar',
  #'gdx-freetype.jar',
  #'gdx-freetype-natives.jar',
]
gdx_jars.each do |j|
  puts "loading #{j}"
  require "#{jardir}/#{j}"
end

desktop_jardir = "./libs/desktop"
desktop_jars = [
  'gdx-backend-lwjgl3-1.13.5.jar', # 3N5-109p not the glfw dependency
  #'gdx-platform-1.13.5-natives-arm64-v8a.jar',
  'gdx-platform-1.13.5-natives-desktop.jar',
  'lwjgl-natives-macos-arm64.jar',
  'lwjgl-glfw-natives-macos-arm64.jar',
  'lwjgl-opengl-natives-macos-arm64.jar',
  #'gdx-lwjgl3-angle-1.13.5.jar',
  #
  # 6N5 these jarfiles come not from libgdx but the GLFW project.
  # https://www.lwjgl.org/customize
  # 6N5 using version 3.3.6 (latest available today)
  'lwjgl.jar',
  'lwjgl-glfw.jar',
  'lwjgl-opengl.jar',
  #'lwjgl-natives-macos-arm64.jar',
  #'lwjgl-openal-natives-macos-arm64.jar',
]
desktop_jars.each do |j|
  puts "loading #{j}"
  require "#{desktop_jardir}/#{j}"
end

desktop_imports = [
  'backends.lwjgl3.Lwjgl3ApplicationConfiguration',
  'backends.lwjgl3.Lwjgl3Application',
]

desktop_imports.each do |i|
  puts "importing #{i}"
  java_import "com.badlogic.gdx.#{i}"
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
  #'backends.lwjgl.LwjglNativesLoader',
  'graphics.GL20',
  #'graphics.Texture',
  #'graphics.Color',
  #'graphics.Mesh',
  #'graphics.Pixmap',
  #'graphics.Camera',
  #'graphics.OrthographicCamera',
  #'graphics.PerspectiveCamera',
  #'graphics.VertexAttributes',
  #'graphics.g2d.TextureRegion',
  #'graphics.g2d.Sprite',
  #'graphics.g2d.SpriteBatch',
  #'graphics.g2d.BitmapFont',
  #'graphics.g2d.freetype.FreeTypeFontGenerator',
  #'graphics.g3d.Environment',
  #'graphics.g3d.Material',
  #'graphics.g3d.Model',
  #'graphics.g3d.ModelBatch',
  #'graphics.g3d.ModelInstance',
  #'graphics.g3d.Renderable',
  #'graphics.g3d.Shader',
  #'graphics.g3d.attributes.ColorAttribute',
  #'graphics.g3d.environment.DirectionalLight',
  #'graphics.g3d.environment.PointLight',
  #'graphics.g3d.loader.G3dModelLoader',
  #'graphics.g3d.utils.CameraInputController',
  #'graphics.g3d.utils.ModelBuilder',
  #'graphics.g3d.utils.RenderContext',
  #'graphics.glutils.ShaderProgram',
  #'graphics.glutils.ShapeRenderer',
  #'math.MathUtils',
  #'math.Quaternion',
  #'math.Vector2',
  #'math.Vector3',
  #'utils.Align',
  'utils.GdxNativesLoader',
  #'utils.TimeUtils',
  #'utils.UBJsonReader',
  #'utils.viewport.ScreenViewport',
  #'utils.viewport.FitViewport',
]

imports.each do |i|
  java_import "com.badlogic.gdx.#{i}"
end

GdxArray = com::badlogic::gdx::utils::Array
SharedLibraryLoader = org::lwjgl::system::SharedLibraryLoader
