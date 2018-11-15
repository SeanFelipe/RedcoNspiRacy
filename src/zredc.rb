require_relative 'java_imports'
require_relative 'utils'
require_relative 'xoppa_shader'


# https://xoppa.github.io/blog/using-materials-with-libgdx/

CAMERA_START_X = 0.0
CAMERA_START_Y = 8.0
CAMERA_START_Z = 20.0

class MainGame < ApplicationAdapter

  def create
    #Gdx::graphics::setContinuousRendering(false)
    $ww, $hh = Gdx::graphics::getWidth, Gdx::graphics::getHeight

    $camera = PerspectiveCamera.new(67, $ww, $hh)
    $camera.position.set(CAMERA_START_X, CAMERA_START_Y, CAMERA_START_Z)
    ## Near and Far (plane) represent the minimum and maximum ranges of the camera in, um, units
    $camera.near = 1.0
    $camera.far = 300.0
    $camera.update

    @camController = CameraInputController.new($camera)
    Gdx::input::setInputProcessor @camController

    @instances = GdxArray.new

    @builder = ModelBuilder.new

    material = Material.new

    @model = @builder.createSphere(2.0, 2.0, 2.0, 20, 20,
      material,
      VertexAttributes::Usage::Position |
      VertexAttributes::Usage::Normal |
      VertexAttributes::Usage::TextureCoordinates
    );

    (-5..5).step(2).each do |xx|
      (-5..5).step(2).each do |zz|
        new_instance = ModelInstance.new(@model, xx, 0, zz)
        @instances.add(new_instance)
      end
    end


    @shader = XoppaShader.new
    @shader.init

    @modelBatch = ModelBatch.new
  end

  def render
    Gdx::gl::gl_clear_color(0, 0, 0, 1)
    #Gdx::gl::gl_clear_color(0.5, 0.5, 0.5, 1)
    Gdx::gl::gl_clear(GL20::GL_COLOR_BUFFER_BIT | GL20::GL_DEPTH_BUFFER_BIT)

    @camController.update

    @modelBatch.begin($camera)

    @instances.each do |instance|
      @modelBatch.render(instance, @shader)
    end

    @modelBatch.end
  end

  def dispose
    @shader.dispose
    @model.dispose
    @modelBatch.dispose
  end
end
