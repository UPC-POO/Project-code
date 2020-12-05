
require_relative '../Modelo/Administrativo'
require_relative '../Modelo/ProfesorTCompleto'

class SolicitanteFactory
	def self.crear(tipo, *arg)
		if tipo == "Administrativo"
			return Administrativo.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8], arg[9], arg[10], arg[11], arg[12], arg[13], arg[14])
		else tipo == "ProfesorTCompleto"
			return	ProfesorTCompleto.new(arg[0], arg[1], arg[2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8], arg[9], arg[10], arg[11], arg[12], arg[13], arg[14])
		end
	end
end
