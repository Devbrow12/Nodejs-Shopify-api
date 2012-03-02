request = require 'request'
# ###Blog
# Clase para manejar el recurso Blog
# sobre un blog podemos hacer
# * Un listado de todos los blogs
#
# * Recibir la cantidad de blogs
#
# * Recibir un único blog
#
# * Crear un nuevo blog
#
# * Modificar un blog existente
#
# * Eliminar un blog de la base de datos
#
class Blog

  # Son obligatorios pasar 3 parámetros
  #
  # * Key y pass para el proceso de autentificación
  #
  # * shop, el nombre de la tienda
  #
  # **Nunca** se debería de instanciar directamente esta clase ya que eso lo hará la clase del cliente
  constructor: (@key, @pass, @shop) ->
    throw new Error 'Blog missing parameters' if not pass? or not key? or not shop?
    
  all: (cb) ->
    request "http://#{@key}:#{@pass}@#{@shop}.shopify.com/admin/blogs", (_,_,body) ->
      process.nextTick ->
        cb(null, JSON.parse body)

module.exports = Blog
