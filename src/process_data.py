import pandas as pd

## function to add new columns to train/test data
def processData(data:pd.DataFrame) -> pd.DataFrame:
    data['closing_return'] = data['close'].pct_change()
    data['target'] = data['closing_return'].shift(-1) > 0
    data['spread'] = data['high'] - data['low']

    data['closing_return'] = data['closing_return'].fillna(0)
    
    return data