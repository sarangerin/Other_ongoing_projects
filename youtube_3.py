# -*- coding: utf-8 -*-
"""
Created on Sun Nov 21 16:47:13 2021

@author: Erin
"""

import pandas as pd
import numpy as np 
import os

#%%  데이터 로드

# 퀘리별 파일 불러오고 퀘리 변수 생성 수 하나의 파일 data로 합침

directory = 'C:/Users/Erin/Downloads/scraper/test/'

file_list = os.listdir(directory)
file_list = [i for i in file_list if i != 'test.csv']


data = pd.DataFrame()

for file in file_list :
    query = file.split('.')[0]
    
    temp = pd.read_csv(directory + file)
    temp['query'] = query
    data = pd.concat([data, temp], axis = 0)

    
data = data.reset_index(drop = 1)
data.to_csv(directory + 'test.csv', index= 0)

#%% 데이터 W
data = data.drop_duplicates(subset=['id']).reset_index(drop = 1)

# 자막 x 제거
data = data.dropna(subset=['transcript']).reset_index(drop = 1)

#%% 
#viewCount 전처리
data['viewCount'] = data['viewCount'].apply(lambda x : x.split()[0])
data['viewCount'] = data['viewCount'].apply(lambda x : x.replace(",",""))
data['viewCount'] = data['viewCount'].apply(lambda x : x.replace("No", "0"))
data['viewCount'] = pd.to_numeric(data['viewCount'])

#%%
#data파일 내 뷰카운트 descriptive
print(data[["viewCount"]].describe())

#%%
#mm:ss to seconds

data['duration_sec'] = data['duration'].apply(lambda x : int(x.split(":")[0])*60 + int(x.split(":")[1]))

#%%
print(data[["duration_sec"]].describe())

#%%


