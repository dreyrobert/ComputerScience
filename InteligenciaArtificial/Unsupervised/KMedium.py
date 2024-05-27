import os
import pandas as pd
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# Configurando o número máximo de CPUs para Loky
os.environ['LOKY_MAX_CPU_COUNT'] = '4'

# Carregando os dados
df = pd.read_csv('C:/Users/Softex/Desktop/workspace/ComputerScience/InteligenciaArtificial/Unsupervised/dados.csv')

# Substitua 'coluna1', 'coluna2', ... pelas colunas relevantes do seu CSV
X = df.drop(columns=['Nome']).values

# Defina o número de clusters
k = 6  # Você pode ajustar o número de clusters conforme necessário

kmeans = KMeans(n_clusters=k, random_state=0)
kmeans.fit(X)

# Adicione os rótulos dos clusters ao DataFrame original
df['Cluster'] = kmeans.labels_

# Remova a coluna 'Nome' antes de calcular as estatísticas
cluster_stats = df.drop(columns=['Nome']).groupby('Cluster').mean()

# Adicione os nomes das pessoas aos clusters correspondentes
df_with_names = df.copy()  # Para manter o DataFrame original
df_with_names['Cluster'] = df_with_names['Cluster'].map({label: f'Cluster {label}' for label in df_with_names['Cluster']})

# Renomear as colunas para tornar as estatísticas mais claras
cluster_stats.rename(columns={col: f'Mean {col}' for col in cluster_stats.columns if col != 'Cluster'}, inplace=True)

# Plotagem (caso os dados sejam 2D)
plt.scatter(X[:, 0], X[:, 1], c=df['Cluster'], cmap='viridis')
plt.xlabel('Coluna1')
plt.ylabel('Coluna2')
plt.title('Agrupamentos K-means')
plt.show()

for index, row in cluster_stats.iterrows():
    print(f"Estatísticas para o Cluster {index}:")
    for column, value in row.items():  # Utilize items() em vez de iteritems()
        print(f"{column}: {value}")
    print("\n")

# Salvar os resultados
df_with_names.to_csv('resultados_com_nomes.csv', index=False)
