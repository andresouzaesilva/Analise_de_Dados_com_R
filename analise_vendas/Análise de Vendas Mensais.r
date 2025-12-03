
# Análise de desempenho comercial


# Carregar bibliotecas
library(ggplot2)

# Criar dados de vendas mensais
meses <- c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", 
           "Jul", "Ago", "Set", "Out", "Nov", "Dez")

set.seed(123)
vendas <- data.frame(
  mes = factor(meses, levels = meses),
  produto_A = round(rnorm(12, mean = 5000, sd = 800), 0),
  produto_B = round(rnorm(12, mean = 4200, sd = 600), 0),
  produto_C = round(rnorm(12, mean = 3500, sd = 500), 0)
)

# Calcular total mensal
vendas$total <- vendas$produto_A + vendas$produto_B + vendas$produto_C


# ANÁLISES


cat("=== RESUMO DE VENDAS ===\n")
cat("Total vendido no ano: R$", format(sum(vendas$total), big.mark = "."), "\n")
cat("Média mensal: R$", format(round(mean(vendas$total), 2), big.mark = "."), "\n")
cat("Melhor mês:", as.character(vendas$mes[which.max(vendas$total)]), 
    "- R$", format(max(vendas$total), big.mark = "."), "\n")
cat("Pior mês:", as.character(vendas$mes[which.min(vendas$total)]), 
    "- R$", format(min(vendas$total), big.mark = "."), "\n")

# Total por produto
cat("\n=== VENDAS POR PRODUTO ===\n")
cat("Produto A: R$", format(sum(vendas$produto_A), big.mark = "."), "\n")
cat("Produto B: R$", format(sum(vendas$produto_B), big.mark = "."), "\n")
cat("Produto C: R$", format(sum(vendas$produto_C), big.mark = "."), "\n")


# VISUALIZAÇÕES


# Gráfico 1: Evolução das Vendas Totais
ggplot(vendas, aes(x = mes, y = total, group = 1)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "blue", size = 3) +
  labs(title = "Evolução das Vendas Totais ao Longo do Ano",
       x = "Mês",
       y = "Vendas (R$)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Gráfico 2: Comparação de Vendas por Produto
vendas_total_produto <- data.frame(
  produto = c("Produto A", "Produto B", "Produto C"),
  total = c(sum(vendas$produto_A), sum(vendas$produto_B), sum(vendas$produto_C))
)

ggplot(vendas_total_produto, aes(x = produto, y = total, fill = produto)) +
  geom_col() +
  geom_text(aes(label = format(total, big.mark = ".")), vjust = -0.5) +
  labs(title = "Total de Vendas por Produto",
       x = "Produto",
       y = "Vendas (R$)") +
  theme_minimal() +
  theme(legend.position = "none")

# Gráfico 3: Vendas Empilhadas por Mês
library(reshape2)
vendas_long <- melt(vendas[, c("mes", "produto_A", "produto_B", "produto_C")], 
                    id.vars = "mes")

ggplot(vendas_long, aes(x = mes, y = value, fill = variable)) +
  geom_col() +
  labs(title = "Composição das Vendas por Mês e Produto",
       x = "Mês",
       y = "Vendas (R$)",
       fill = "Produto") +
  scale_fill_manual(values = c("produto_A" = "#FF6B6B", 
                                "produto_B" = "#4ECDC4", 
                                "produto_C" = "#FFE66D"),
                    labels = c("Produto A", "Produto B", "Produto C")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Salvando dados
write.csv(vendas, "vendas_mensais.csv", row.names = FALSE)
cat("\nDados salvos em 'vendas_mensais.csv'\n")