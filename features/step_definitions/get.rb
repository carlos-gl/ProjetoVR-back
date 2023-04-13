Dado('que o usuario consulte as informações dos produtos e estabelecimentos') do
    # atribuo a variavel 'getUrl' a url da api que será consultada.
    @getUrl = 'https://portal.vr.com.br/api-web/comum/enumerations/VRPAT'
  end
  
  Quando('ele fazer uma pesquisa') do
    # atribuo a variavel 'responseGet' o response retornado no get.
    @responseGet = HTTParty.get(@getUrl)
  end
  
  Entao('uma lista de valores da chave typeOfEstablishment deve ser retornado') do
    # valido que existe a chave typeOfEstablishment no response.
    expect(@responseGet).to include("typeOfEstablishment")

    # Filtro somenete os resultados da chave typeOfEstablishment e atribuo a nova variavel 'responseParsed'.
    @responseParsed = @responseGet.parsed_response["typeOfEstablishment"].sample

    # depois de filtrado os dados crio um nova variavel 'randomResult' onde atribuo dados randomicos referentes aos valores da chave typeOfEstablishment.
    @randomResult = "Informações de um dos estabelecimentos:\n" \
    "Chave: #{@responseParsed['key']}\n" \
    "Nome: #{@responseParsed['name']}\n" \
    "Descrição: #{@responseParsed['label']}"

    # printo os valores no console.
    puts @randomResult 
  end