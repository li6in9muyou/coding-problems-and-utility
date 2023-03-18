class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y


world = [[False] * 1001 for i in range(1001)]


def mark_enemy(x, y):
    world[y][x] = True


def enemy_is_here(x, y):
    return world[x][y] is True


def count_in_grid(lt, rX, rY):
    cnt = 0
    for y in range(rY + 1):
        for x in range(rX + 1):
            if enemy_is_here(lt.y + y, lt.x + x):
                cnt += 1
    return cnt


N, rangeX, rangeY = map(int, input().split(' '))
maxPossibleKill = (rangeX + 1) * (rangeY + 1)

enemyBound = Point(0, 0)

for i in range(N):
    x, y = map(int, input().split(' '))
    mark_enemy(x, y)
    enemyBound.x = max(enemyBound.x, x)
    enemyBound.y = max(enemyBound.y, y)

maxKill = 0
for ltX in range(enemyBound.x - rangeX + 1):
    for ltY in range(enemyBound.y - rangeY + 1):
        maxKill = max(maxKill, count_in_grid(Point(ltX, ltY), rangeX, rangeY))
        if maxKill == maxPossibleKill:
            print(maxKill)
            exit(0)

print(maxKill)
