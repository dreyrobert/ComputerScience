class Retangulo:
    def __init__(self, num, xb_coord, yb_coord, xt_coord, yt_coord):
        self.xb_coord = xb_coord
        self.yb_coord = yb_coord
        self.xt_coord = xt_coord
        self.yt_coord = yt_coord
        self.num = num
    
    def sobreposicao(a, b):
        if a.xb_coord > b.xt_coord or b.xb_coord > a.xt_coord:
            return False
        
        if a.yb_coord > b.yt_coord or b.yb_coord > a.yt_coord:
            return False
        
        return True
    
    def print(self):
        print("Coordenada xt: ", self.xt_coord)
        print("Coordenada yt: ", self.yt_coord)
        print("Coordenada xb: ", self.xb_coord)
        print("Coordenada yb: ", self.yb_coord)
        