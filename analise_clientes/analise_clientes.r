
# Análise de base de clientes


# Carregar bibliotecas
library(ggplot2)

# Criar base de dados de clientes
set.seed(789)
clientes <- data.frame(
  id = 1:100,
  idade = round(rnorm(100, mean = 35, sd = 12)),
  genero = sample(c("M", "F"), 100, replace = TRUE),
  cidade = sample(c("São Paulo", "Rio de Janeiro", "Belo Horizonte", "Curitiba", "Porto Alegre"), 
                  100, replace = TRUE, prob = c(0.3, 0.25, 0.2, 0.15, 0.1)),
  gasto_mensal = round(rnorm(100, mean = 500, sd = 200), 2)
)

# Ajustar idade para valores realistas
clientes$idade <- pmin(pmax(clientes$idade, 18), 70)
clientes$gasto_mensal <- pmax(clientes$gasto_mensal, 50)

# Classificar clientes por gasto
clientes$categoria <- cut(clientes$gasto_mensal, 
                          breaks = c(0, 300, 600, Inf),
                          labels = c("Baixo", "Médio", "Alto"))


# ANÁLISES


cat("=== PERFIL DA BASE DE CLIENTES ===\n")
cat("Total de clientes:", nrow(clientes), "\n")
cat("Idade média:", round(mean(clientes$idade), 1), "anos\n")
cat("Gasto médio mensal: R$", round(mean(clientes$gasto_mensal), 2), "\n")

cat("\n=== DISTRIBUIÇÃO POR GÊNERO ===\n")
print(table(clientes$genero))

cat("\n=== CLIENTES POR CIDADE ===\n")
print(sort(table(clientes$cidade), decreasing = TRUE))

cat("\n=== CLIENTES POR CATEGORIA DE GASTO ===\n")
print(table(clientes$categoria))


# VISUALIZAÇÕES


# Gráfico 1: Distribuição de Idades
ggplot(clientes, aes(x = idade)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "white") +
  labs(title = "Distribuição de Idade dos Clientes",
       x = "Idade",
       y = "Quantidade de Clientes") +
  theme_minimal()

# Gráfico 2: Clientes por Cidade
cidade_count <- as.data.frame(table(clientes$cidade))
names(cidade_count) <- c("cidade", "quantidade")

ggplot(cidade_count, aes(x = reorder(cidade, quantidade), y = quantidade, fill = cidade)) +
  geom_col() +
  geom_text(aes(label = quantidade), hjust = -0.3) +
  coord_flip() +
  labs(title = "Número de Clientes por Cidade",
       x = "Cidade",
       y = "Quantidade") +
  theme_minimal() +
  theme(legend.position = "none")

# Gráfico 3: Gasto Médio por Categoria
gasto_categoria <- aggregate(gasto_mensal ~ categoria, clientes, mean)

ggplot(gasto_categoria, aes(x = categoria, y = gasto_mensal, fill = categoria)) +
  geom_col() +
  geom_text(aes(label = paste("R$", round(gasto_mensal, 2))), vjust = -0.5) +
  labs(title = "Gasto Médio Mensal por Categoria",
       x = "Categoria",
       y = "Gasto Médio (R$)") +
  theme_minimal() +
  theme(legend.position = "none")

# Gráfico 4: Relação Idade x Gasto
ggplot(clientes, aes(x = idade, y = gasto_mensal)) +
  geom_point(color = "darkgreen", alpha = 0.6, size = 2) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Relação entre Idade e Gasto Mensal",
       x = "Idade",
       y = "Gasto Mensal (R$)") +
  theme_minimal()

# Salvando dados processados
write.csv(clientes, "base_clientes.csv", row.names = FALSE)
cat("\nDados salvos em 'base_clientes.csv'\n")