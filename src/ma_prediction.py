import os
import pandas as pd

df = pd.read_csv(os.path.join('data', 'test.csv'))
df.head()

df['5_closing_ma'] = df['close'].rolling(window=5).mean()
df['20_closing_ma'] = df['close'].rolling(window=20).mean()

df.fillna(0, inplace=True)
df['target'] = df['5_closing_ma'] < df['20_closing_ma'].astype(int)

df = df[['row_id', 'target']]

df.to_csv(os.path.join('data', 'submission.csv'), index=False)