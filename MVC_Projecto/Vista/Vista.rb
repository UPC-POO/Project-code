require_relative '../Modelo/Universidad'
require_relative '../Controlador/Controlador'

class Vista
	def mostrar(mensaje)
		puts mensaje
	end
	def mostrarExcepcion(mensaje)
		puts mensaje
	end
	def mostrarListado(arreglo)
		puts "----------------------------------------------------- LISTA DE SOLICITANTES --------------------------------------------"
		for solicitante in arreglo
			puts "CODIGO DE SOLICITUD: #{solicitante.generarCodigoAfiliacion}"+"\nNombre Completo: #{solicitante.nombre}  |  DNI: #{solicitante.dni}  |  Edad: #{solicitante.edad}    CODIREGISTRO: #{}        |  Mes Afiliacion: #{solicitante.mesAfiliacion}  |  Plan EPS: #{solicitante.tipoPlanEPS}\nCodigo de Usuario: #{solicitante.codigoColaborador}      |  COD Sede: #{solicitante.codigoSede}   |  Campus: #{solicitante.descripcionSede}  |  Contrato: #{solicitante.tipoContrato}       |  N° de Dependientes: #{solicitante.numeroDependientes}"+"\nGratifiacion: #{solicitante.calcularGratificacion} Tarifa EPS: #{solicitante.calcularTarifaEPS}"
		end
	end
	def mostrarEvaluacion(arreglo)
		puts "----------------------------------------------------- REPORTE DE REGISTRO --------------------------------------------"
		for solicitante in arreglo
			if solicitante.solicitudDeAfiliacion == true && solicitante.tipoContrato == "FullTime"
						valor = puts"La solicitud de #{solicitante.nombre} con codigo #{solicitante.generarCodigoAfiliacion} fue APROBADA"
			puts "---------------------------------------------------------------------------------------------------------------------------"
			else solicitante.solicitudDeAfiliacion == false 
						valor = puts "La solicitud de #{solicitante.nombre} con codigo #{solicitante.generarCodigoAfiliacion} no fue aprobada, debido a que no cumple con los requisitos."
			end
		end
		return valor
	end
	def mostrarAfiliadosDependientes(arreglo)
		puts "----------------------------------------------------- SOLICITANTES CON DEPENDIENTES --------------------------------------------"
		for solicitante in arreglo
			if solicitante.numeroDependientes > 0
				puts solicitante.obtenerDatos
			else
				return nil
			end
		end
	end
	def mostrarListadoAfiliados(arreglo)
		puts
		return puts "La cantidad de afiliados son = #{arreglo.count}"
	end
	def mostrarImporteTotalEPS(arreglo)
		puts "---------------------------------------------- SUMA DE IMPORTES EPS ---------------------------------------------"
		sumaTotal = 0
		for solicitante in arreglo
			sumaTotal = sumaTotal + solicitante.calcularTarifaEPS
		end
			return puts "La suma total del importe de EPS de los colaboradores es: #{sumaTotal}"
	end
	def mostrarAfiliado(solicitante)
		puts "----------------------------------------------------- BUSCAR -----------------------------------------------------"
		if solicitante != nil
			puts "CODIGO DE SOLICITUD: #{solicitante.generarCodigoAfiliacion}"+"\nNombre Completo: #{solicitante.nombre}  |  DNI: #{solicitante.dni}  |  Edad: #{solicitante.edad}    CODIREGISTRO: #{}        |  Mes Afiliacion: #{solicitante.mesAfiliacion}  |  Plan EPS: #{solicitante.tipoPlanEPS}\nCodigo de Usuario: #{solicitante.codigoColaborador}      |  COD Sede: #{solicitante.codigoSede}   |  Campus: #{solicitante.descripcionSede}  |  Contrato: #{solicitante.tipoContrato}       |  N° de Dependientes: #{solicitante.numeroDependientes}"+"\nGratifiacion: #{solicitante.calcularGratificacion} Tarifa EPS: #{solicitante.calcularTarifaEPS}"
		else
			puts  "Afiliado no encontrado"
		end
	end
	def mostrarSolicitanteMayorSueldo(arreglo)
		puts
		puts "--------------------------- Solicitante Mayor Sueldo ------------------------------"
		mayorSueldo = 0
		solicitanteMayorSuel = nil
		for solicitante in arreglo
			if solicitante.calcularSueldoFinal > mayorSueldo
				mayorSueldo = solicitante.calcularSueldoFinal
				solicitanteMayorSuel = solicitante
			end
		end
		return puts "El postulante de Mayor calificacion es: \n#{solicitanteMayorSuel.obtenerDatos}"
	end
	def mostrarSolicitanteMenor(arreglo)
		puts
		puts "--------------------------- Solicitante Menor Sueldo ------------------------------"
		menorSueldo = 999999
		solicitanteMenorSuel = nil

		for solicitante in arreglo
			if solicitante.calcularSueldoFinal < menorSueldo
				menorSueldo = solicitante.calcularSueldoFinal
				solicitanteMenorSuel = solicitante
			end
		end
		return puts "El Solicitante de menor calificacion es: \n#{solicitanteMenorSuel.obtenerDatos}"
	end
	def mostrarAdministrativoMayor(arreglo)
		puts
		puts "--------------------------- Administrativo Mayor Sueldo ------------------------------"
		mayorSueldo = 0
		solicitanteMayorSuel = nil

		for solicitante in arreglo
			if (solicitante.is_a? Administrativo) && solicitante.calcularSueldoFinal > mayorSueldo
				mayorSueldo = solicitante.calcularSueldoFinal
				solicitanteMayorSuel = solicitante
			end
		end
		return puts "El Administrativo de Mayor Sueldo es: \n#{solicitanteMayorSuel.obtenerDatos}"
	end
	def mostrarProfesorMayor(arreglo)
		puts
		puts "--------------------------- Profesor Mayor Sueldo ------------------------------"
		mayorSueldo = 0
		solicitanteMayorSuel = nil
		for solicitante in arreglo
			if (solicitante.is_a? ProfesorTCompleto) && solicitante.calcularSueldoFinal > mayorSueldo
				mayorSueldo = solicitante.calcularSueldoFinal
				solicitanteMayorSuel = solicitante
			end
		end
		return puts "El Profesor de Mayor Sueldo es: \n#{solicitanteMayorSuel.obtenerDatos}"
	end
end

vista = Vista.new
univ = Universidad.instance
controlador = Controlador.new(vista, univ)
controlador.registrar("Administrativo",true, "Febrero", "Plan Base", "74585490", "BMENDOZA", "Brayan Mendoza", 36, 3, "SM", "San Miguel", "FullTime","AFP", true, "Analista", 2800)
controlador.registrar("Administrativo",true, "Febrero", "Plan Base", "74585490", "BMENDOZA", "Brayan Mendoza", 36, 3, "SM", "San Miguel", "FullTime","AFP", true, "Analista", 2800)
controlador.registrar("Administrativo",true, "Febrero", "Plan Base", "98626526", "MSANTOS", "Mario Santos", 37, 1, "SM", "San Miguel", "FullTime","AFP", false, "Supervisor", 3000)
controlador.registrar("Administrativo",true, "Agosto", "Plan Base", "74585490", "MCASTANEDA", "Martin Castaneda", 38, 2, "SM", "San Miguel", "FullTime","AFP", true, "Gerente", 4000)
controlador.registrar("Administrativo",true, "Febrero", "Adicional 2", "75516814", "BMYERS", "Bryan Myers", 40, 3, "MO", "Monterrico", "FullTime","AFP", true, "Supervisor", 3000)
controlador.registrar("Administrativo",true, "Diciembre", "Plan Base", "74895235", "ZLOPEZ", "Zara Lopez", 37, 1, "SM", "San Miguel", "FullTime","AFP", true, "Director", 5000)
controlador.registrar("Administrativo",true, "Febrero", "Adicional 2", "98626525", "PVIDAL", "Paul Vidal", 35, 2, "SM", "San Miguel", "FullTime","AFP", true, "Coordinador", 4000)
controlador.registrar("ProfesorTCompleto",true, "Julio", "Adicional 1","70936667", "FBELLO", "Francisco Bello", 23, 1, "MO", "Monterrico", "FullTime","ONP", true, 3100, 5)
controlador.registrar("ProfesorTCompleto",true, "Julio", "Adicional 1","70936667", "FBELLO", "Francisco Bello", 23, 1, "MO", "Monterrico", "FullTime","ONP", true, 3100, 5)
controlador.registrar("ProfesorTCompleto",true, "Julio", "Adicional 1","70936667", "FBELLO", "Francisco Bello", 24, 1, "MO", "Monterrico", "FullTime","ONP", true, 3500, 7)
controlador.registrar("ProfesorTCompleto",true, "Diciembre", "Adicional 2","87481118", "JPEREZ", "Juan Perez", 26, 1, "MO", "Monterrico", "FullTime","AFP", true, 3000, 15)
controlador.registrar("ProfesorTCompleto",true, "Febrero", "Adicional 2","86565605", "BZABALAGA", "Brandon Zavalaga", 28, 1, "SV", "Villa", "PartTime","ONP", true, 4100, 5)
controlador.registrar("ProfesorTCompleto",true, "Agosto", "Adicional 3","715645254", "JJHONSON", "Jack Jhonson", 23, 2, "MO", "Monterrico", "FullTime","AFP", true, 3300, 4)
controlador.registrar("ProfesorTCompleto",true, "Noviembre", "Adicional 1","68465355", "KPEREZ", "Katy Perez", 25, 3, "SV", "Villa", "PartTime","AFP", true, 5200, 2)

controlador.listarSolicitante
controlador.evaluarRegistro
controlador.listarAfiliadosconDependientes
controlador.listarCantidadAfiliados
controlador.calcularImporteTotalEPS
controlador.buscarAfiliado("74585490")
controlador.obtenerSolicitanteMayor
controlador.obtenerSolicitanteMenorSueldo
controlador.obtenerAdministrativoMayorSueldo
controlador.obtenerProfesorMayorSueldo