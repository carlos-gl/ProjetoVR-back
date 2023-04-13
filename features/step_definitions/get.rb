Dado('que o usuario consulte as informações dos produtos e estabelecimentos') do
    @getUrl = 'https://portal.vr.com.br/api-web/comum/enumerations/VRPAT'
  end
  
  Quando('ele fazer uma pesquisa') do
    @resultGet = HTTParty.get(@getUrl)
  end
  
  Entao('uma lista de valores da chave typeOfEstablishment deve ser retornado') do
    expect(@resultGet).to include("typeOfEstablishment")
    @responseParsed = @resultGet.parsed_response["typeOfEstablishment"].sample
    @randomResult = "Informações de um dos estabelecimentos\n" \
    "Chave: #{@responseParsed['key']}\n" \
    "Nome: #{@responseParsed['name']}\n" \
    "Descrição: #{@responseParsed['label']}"
    puts @randomResult 
  end