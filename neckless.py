import heapq

n,c,k = map(int,input().split())

#print(n, c, k)

pipes = []

for i in range(int(n)):
    pipes.append(list(map(lambda x: x*(-1), map(int, input().split()))))
    pipes[i][0], pipes[i][1] = pipes[i][1], pipes[i][0]


#太い順に並べるO(nlogn)
pipes = sorted(pipes, key=lambda x:(x[1], x[0]))

#print(pipes) 

# k個とったときの最安がcを超えないかどうか
buy_pipes = pipes[0:k]

#を優先度付キューにします^q^ 
heapq.heapify(buy_pipes)

#print(heapq.nsmallest(3, buy_pipes))

#さすがにもっと良い書き方あるはず
price = map(sum, zip(*buy_pipes))
price = next(price)
#print(price)

if price*(-1) > c:
    
    #細いパイプを妥協召喚してく O(k)
    for i in range(k,n):
        # print(i)
        # print(pipes[i])
        
        #細いパイプが一番高いやつより安ければ、一番高いやつといれかえ
        if pipes[i][0] > buy_pipes[0][0]:
            price -= buy_pipes[0][0]
            price += pipes[i][0]
            
            #自動で順番に並び替えO(logk)
            heapq.heappushpop(buy_pipes, pipes[i])
            
            #値段更新、判定
            if price*(-1) <= c:
                break

        #print(buy_pipes)

#O(klogk)でいける！ヒープ強すぎ
    
# #組み合わせの最後がボトルネックのはず
print(heapq.nlargest(1, buy_pipes, key=lambda x:(x[1], x[0]))[0][1]*(-1))
