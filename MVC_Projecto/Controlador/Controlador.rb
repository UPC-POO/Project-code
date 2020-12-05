
require_relative './ConcursanteFactory'
require_relative '../Modelo/Universidad'


class Controlador
  attr_reader :vista, :modelo
  def initialize(vista, modelo)
    @vista = vista
    @modelo = modelo
  end

  def registrar(tipo, *arg)
    solicitante = SolicitanteFactory.crear(tipo, *arg)
    begin
      modelo.registrarSolicitante(solicitante)
      vista.mostrar("Solicitante registrado.")
    rescue Exception => e
      vista.mostrarExcepcion(e.message)
    end
  end
  def listarSolicitante
    arreglo = modelo.arregloSolicitantes
    vista.mostrarListado(arreglo)
  end
  def evaluarRegistro
    solicitante = modelo.arregloSolicitantes
    vista.mostrarEvaluacion(solicitante)
  end
  def listarAfiliadosconDependientes
    solicitante = modelo.arregloSolicitantes
    vista.mostrarAfiliadosDependientes(solicitante)
  end
  def listarCantidadAfiliados
    solicitante = modelo.arregloSolicitantes
    vista.mostrarListadoAfiliados(solicitante)
  end
  def calcularImporteTotalEPS
    solicitante = modelo.arregloSolicitantes
    vista.mostrarImporteTotalEPS(solicitante)
  end
  def buscarAfiliado(dni)
    solicitante = modelo.buscarAfiliadoPorDNI(dni)
    vista.mostrarAfiliado(solicitante)
  end
  def obtenerSolicitanteMayor
    solicitante = modelo.arregloSolicitantes
    vista.mostrarSolicitanteMayorSueldo(solicitante)
  end
  def obtenerSolicitanteMenorSueldo
    solicitante = modelo.arregloSolicitantes
    vista.mostrarSolicitanteMenor(solicitante)
  end
  def obtenerAdministrativoMayorSueldo
    solicitante = modelo.arregloSolicitantes
    vista.mostrarAdministrativoMayor(solicitante)
  end
  def obtenerProfesorMayorSueldo
    solicitante = modelo.arregloSolicitantes
    vista.mostrarProfesorMayor(solicitante)
  end
end