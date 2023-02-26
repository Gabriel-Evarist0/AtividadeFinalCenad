programa
{
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Util --> u
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> mat
	
	
	cadeia clientes[100] 
	cadeia produtos[100]
	cadeia vendas[100]
	
	funcao inicio(){
		
		preparation()
		menu()
		
	}

	funcao cadastro(inteiro acao){
		
		
		
		cadeia nomeClient, nomeProduto, cpf
		inteiro qnt
		real preco
		escolha(acao){
			caso 1:
				inteiro arquivo = arq.abrir_arquivo("./clientes.txt", arq.MODO_ACRESCENTAR)
				escreva("Nome do Cliente: ")
				leia(nomeClient)
				escreva("Cpf do Cliente: ")
				leia(cpf)
				arq.escrever_linha(nomeClient + " -- " +cpf , arquivo)
				arq.fechar_arquivo(arquivo)
				pare
			caso 2:
				inteiro arquivo1 = arq.abrir_arquivo("./produtos.txt", arq.MODO_ACRESCENTAR)
				escreva("Nome do Produto: ")
				leia(nomeProduto)
				escreva("Preço: ")
				leia(preco)
				arq.escrever_linha(nomeProduto + " -- R$" + preco, arquivo1)
				arq.fechar_arquivo(arquivo1)
				pare
			caso 3:
				
				cadeia prodComprado
				escreva("Cliente: ")
				leia(nomeClient)
				escreva("Produto comprado: ")
				leia(prodComprado)
				cadeia str = busca(2, prodComprado)
				inteiro pos = tx.posicao_texto("$",str,0)
				cadeia str2 = tx.extrair_subtexto(str, pos + 1, tx.numero_caracteres(str))
				escreva("Quantidade: ")
				leia(qnt)
				inteiro arquivo2 = arq.abrir_arquivo("./vendas.txt", arq.MODO_ACRESCENTAR)
				real precoTotal = (tp.cadeia_para_real(str2) * qnt)
				arq.escrever_linha("Cliente: "+ nomeClient + "| Produto Comprado: " + prodComprado + "| Quantidade: " + qnt + "| Preço total: R$" + mat.arredondar(precoTotal,2), arquivo2)
				arq.fechar_arquivo(arquivo2)
				pare
		}
		
		
		
		
		
		//preparation()
		}
	funcao ler(inteiro acao){
		inteiro arquivo = arq.abrir_arquivo("./clientes.txt", arq.MODO_LEITURA)
		inteiro arquivo1 = arq.abrir_arquivo("./produtos.txt", arq.MODO_LEITURA)
		inteiro arquivo2 = arq.abrir_arquivo("./vendas.txt", arq.MODO_LEITURA)
		cadeia linha
		escolha(acao){
			caso 1:				
				escreva("Clientes:\n--------\n")
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo); i++){
					linha = arq.ler_linha(arquivo)
					escreva(linha + "\n")
				}
				
				pare
			caso 2:
				escreva("Produtos:\n--------\n")
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo1); i++){
					linha = arq.ler_linha(arquivo1)
					escreva(linha + "\n")
				}
				pare
			caso 3:
				escreva("Vendas:\n--------\n")
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo2); i++){
					linha = arq.ler_linha(arquivo2)
					escreva(linha + "\n")
				}
				pare	
		}
		arq.fechar_arquivo(arquivo)
		arq.fechar_arquivo(arquivo1)
		arq.fechar_arquivo(arquivo2)
	}
	funcao cadeia busca(inteiro acao, cadeia doc){
		cadeia nomePesq, nomeProd, numVend
		cadeia linha = ""
		inteiro pos = 0
		inteiro tamanhoPesquisa
		escolha(acao){
			caso 1:
			inteiro arquivo = arq.abrir_arquivo("./clientes.txt", arq.MODO_LEITURA)
				tamanhoPesquisa = tx.numero_caracteres(doc)
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo); i++){
				linha = arq.ler_linha(arquivo)	
					se (tx.posicao_texto(doc,linha,0) != -1){
					escreva(linha+"\n")
					retorne linha
				}
			}
				
			arq.fechar_arquivo(arquivo)
			pare
			caso 2:
			inteiro arquivo1 = arq.abrir_arquivo("./produtos.txt", arq.MODO_LEITURA)
				tamanhoPesquisa = tx.numero_caracteres(doc)
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo1); i++){
				linha = arq.ler_linha(arquivo1)	
					se (tx.posicao_texto(doc,linha,0) != -1){
					escreva(linha+"\n")
					retorne linha
					}
				}
			arq.fechar_arquivo(arquivo1)
			pare
			caso 3:
				inteiro arquivo2 = arq.abrir_arquivo("./vendas.txt", arq.MODO_LEITURA)
				tamanhoPesquisa = tx.numero_caracteres(doc)
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo2); i++){
				linha = arq.ler_linha(arquivo2)	
					se (tx.posicao_texto(doc,linha,0) != -1){
					escreva(linha+"\n")
					retorne linha
					}
				}
			
			arq.fechar_arquivo(arquivo2)
			pare
		}	
		retorne linha
	}

	funcao preparation(){
		
		inteiro arquivo = arq.abrir_arquivo("./clientes.txt", arq.MODO_LEITURA)
		inteiro arquivo1 = arq.abrir_arquivo("./produtos.txt", arq.MODO_LEITURA)
		inteiro arquivo2 = arq.abrir_arquivo("./vendas.txt", arq.MODO_LEITURA)
				
		para (inteiro i = 0; nao arq.fim_arquivo(arquivo); i++){
			clientes[i] = arq.ler_linha(arquivo)
			
		}
		para (inteiro i = 0; nao arq.fim_arquivo(arquivo1); i++){
			produtos[i] = arq.ler_linha(arquivo1)
			
		}
		para (inteiro i = 0; nao arq.fim_arquivo(arquivo2); i++){
			vendas[i] = arq.ler_linha(arquivo2)
			
		}
		arq.fechar_arquivo(arquivo)
		arq.fechar_arquivo(arquivo1)
		arq.fechar_arquivo(arquivo2)
	}
	
	funcao menu(){
		inteiro choose
		inteiro choose2
		cadeia nomeCl,nomeProd
		escreva("---MENU---\n")
		escreva("1 - Mostrar todos\n")
		escreva("2 - Cadastrar\n")
		escreva("3 - Buscar\n")
		escreva("Escolha: ")
		leia(choose)
		escolha(choose){
			caso 1:
				escreva("---MOSTRAR TODOS---\n")	
				escreva("1 - Clientes\n")
				escreva("2 - Produtos\n")
				escreva("3 - Vendas\n")
				leia (choose2)
				ler(choose2)
				pare
			caso 2:
				escreva("---CADASTRAR---\n")
				escreva("1 - Clientes\n")
				escreva("2 - Produtos\n")
				escreva("3 - Vendas\n")
				escreva("Escolha: ")
				leia(choose2)
				cadastro(choose2)
				pare
			caso 3:
				escreva("---BUSCAR---\n")
				escreva("1 - Clientes\n")
				escreva("2 - Produtos\n")
				escreva("3 - Vendas\n")
				leia(choose2)
				escolha (choose2){
					caso 1:
						escreva("Nome do Cliente: ")
						leia(nomeCl)
						busca(1,nomeCl)
						pare
					caso 2:
						escreva("Nome do Produto: ")
						leia(nomeProd)
						busca(2,nomeProd)
						pare
					caso 3:
						escreva("Nome do Cliente: ")
						leia(nomeCl)
						escreva("\nCompras de " + nomeCl + " encontradas\n")
						escreva("------------------------------------------\n")
						busca(3,nomeCl)
				}
				
				pare
		}
	}
	funcao debugTeste(cadeia doc){
		inteiro arquivo = arq.abrir_arquivo("./clientes.txt", arq.MODO_LEITURA)
		inteiro arquivo1 = arq.abrir_arquivo("./produtos.txt", arq.MODO_LEITURA)
		inteiro arquivo2 = arq.abrir_arquivo("./vendas.txt", arq.MODO_LEITURA)
		cadeia linha
		inteiro tamanhoPesquisa = tx.numero_caracteres(doc)
		para (inteiro i = 0; nao arq.fim_arquivo(arquivo1); i++){
			linha = arq.ler_linha(arquivo1)	
			se (tx.posicao_texto(doc,linha,0) != -1){
				escreva(linha+"\n")
			}
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 707; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */