h,w = map(int,input().split())
grid = []

grid = [list(input()) for i in range(h)]
    
#print(grid)

for i in range(h):
    for j in range(w):
        if grid[i][j] == "S":
            start_x = j
            start_y = i

def solve(x, y):

    if grid[y][x] == "G":
        #print("G!!")
        return list("G")

    grid[y][x] = "#"

    for (next_y, next_x, d) in [(y, x+1, "R"), (y+1, x, "D"), (y-1, x, "U"), (y, x-1, "L")]:
        
        if (next_x < 0 or next_x >= w or next_y < 0 or next_y >= h):
            continue 
        
        if grid[next_y][next_x] == "#":
            continue
        
        route=solve(next_x, next_y)

        if route:
            return list(d) + route

course = solve(start_x,start_y)

course.pop()

print("".join(course))
#print(grid)
