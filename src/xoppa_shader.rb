class XoppaShader
  include Shader # implementing a Java interface

  def init
    vert = sh("color.vertex.glsl").readString
    frag = sh("/color.fragment.glsl").readString
    @program = ShaderProgram.new(vert, frag)

    if not @program.isCompiled
      raise RuntimeError, "shader program failed to compile with error: #{@program.getLog()}"
    end

    @u_projTrans = @program.getUniformLocation("u_projTrans")
    @u_worldTrans = @program.getUniformLocation("u_worldTrans")
    @u_color = @program.getUniformLocation("u_color")
  end

  def dispose
    @program.dispose
  end

  def begin(camera, context)
    @camera = camera
    @context = context

    @program.begin
    @program.setUniformMatrix(@u_projTrans, @camera.combined);
    @context.setDepthTest(GL20::GL_LEQUAL);
    @context.setCullFace(GL20::GL_BACK);
  end

  def render(renderable)
    @program.setUniformMatrix(@u_worldTrans, renderable.worldTransform)
    @program.setUniformf(@u_color, MathUtils.random(), MathUtils.random(), MathUtils.random())
    renderable.meshPart.render(@program)
  end

  def end
    @program.end
  end

  def compareTo(other_shader)
    return 0
  end

  def canRender(instance)
    return true
  end
end

