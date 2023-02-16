programa
{
	inclua biblioteca Arquivos --> arq
	inclua biblioteca Util --> u
	
	
	cadeia clientes[100] 
	cadeia produtos[100]
	cadeia vendas[100]
	
	funcao inicio(){
		preparation()
		menu()
		
	}

	funcao cadastro(inteiro acao){
		inteiro arquivo = arq.abrir_arquivo("./clientes.txt", arq.MODO_ACRESCENTAR)
		inteiro arquivo1 = arq.abrir_arquivo("./produtos.txt", arq.MODO_ACRESCENTAR)
		inteiro arquivo2 = arq.abrir_arquivo("./vendas.txt", arq.MODO_ACRESCENTAR)
		cadeia nomeClient, nomeProduto, numVenda
		escolha(acao){
			caso 1:
				escreva("Nome do Cliente: ")
				leia(nomeClient)
				arq.escrever_linha(nomeClient , arquivo)
				pare
			caso 2:
				escreva("Nome do Produto: ")
				leia(nomeProduto)
				arq.escrever_linha(nomeProduto , arquivo1)
				pare
			caso 3:
				escreva("Numero da Venda: ")
				leia(numVenda)
				arq.escrever_linha(numVenda , arquivo2)
				pare
		}
		
		
		arq.fechar_arquivo(arquivo)
		arq.fechar_arquivo(arquivo1)
		arq.fechar_arquivo(arquivo2)
		preparation()
		}
	funcao ler(inteiro acao){
		inteiro arquivo = arq.abrir_arquivo("./clientes.txt", arq.MODO_LEITURA)
		inteiro arquivo1 = arq.abrir_arquivo("./produtos.txt", arq.MODO_LEITURA)
		inteiro arquivo2 = arq.abrir_arquivo("./vendas.txt", arq.MODO_LEITURA)
		escolha(acao){
			caso 1:
				escreva("Clientes:\n--------\n")
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo); i++){
					clientes[i] = arq.ler_linha(arquivo)
					escreva(clientes[i] + "\n")
				}
				pare
			caso 2:
				escreva("Produtos:\n--------\n")
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo1); i++){
					produtos[i] = arq.ler_linha(arquivo1)
					escreva( produtos[i] + "\n")
				}
				pare
			caso 3:
				escreva("Vendas:\n--------\n")
				para (inteiro i = 0; nao arq.fim_arquivo(arquivo2); i++){
					vendas[i] = arq.ler_linha(arquivo2)
					escreva(vendas[i] + "\n")
				}
				pare	
		}
		arq.fechar_arquivo(arquivo)
	}
	funcao busca(inteiro acao){
		cadeia nomePesq, nomeProd, numVend
		inteiro pos = 0
		escolha(acao){
			caso 1:
				escreva("Nome do Cliente: ")
				leia(nomePesq)
				enquanto(pos < 99 e clientes[pos] != nomePesq){
					pos++
			}
				se (clientes[pos] == nomePesq){
					escreva("----------------\n")
					escreva("Foi encontrado: : " + clientes[pos] + ("\nNa posição: " + pos))
			}
				senao{
					escreva("Não foi encontrado: ")
			}
			pare
			caso 2:
				escreva("Nome do Produto: ")
				leia(nomeProd)
				enquanto(pos < 99 e produtos[pos] != nomeProd){
					pos++
			}
				se (produtos[pos] == nomeProd){
					escreva("----------------\n")
					escreva("Foi encontrado: : " + produtos[pos] + ("\nNa posição: " + pos))
			}
				senao{
					escreva("Não foi encontrado:  ")
			}
			pare
			caso 3:
				escreva("Numero da Venda: ")
				leia(numVend)
				enquanto(pos < 99 e vendas[pos] != numVend){
					pos++
			}
				se (vendas[pos] == numVend){
					escreva("----------------\n")
					escreva("Encontrado: " + vendas[pos] + ("\nNa posição: " + pos))
			}
				senao {
					escreva("Não foi encontrado:  ")
			}
			pare
		}	
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
				busca(choose2)
				pare
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2205; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */