class Solution {
public:
    int rows,cols;
    vector<vector<int>>dist;
    priority_queue<pair<int,pair<int,int>>,vector<pair<int,pair<int,int>>>,greater<>> pq;

    bool isValid(int x,int y){
        return x>=0 && x<rows && y>=0 && y<cols;
    }

    bool check(int&nvDist,int oldDist){
        return nvDist<oldDist;
    }

    void rigel(int x,int y,int d,auto& grid){
        if(isValid(x,y)){
            int nvDist=d+grid[x][y];
            if(check(nvDist,dist[x][y])){
                dist[x][y]=nvDist;
                pq.push({nvDist,{x,y}});
            }
        }
    }

    int minimumObstacles(vector<vector<int>>& grid) {
        rows=grid.size(),cols=grid[0].size();
        //initialization
        dist.assign(rows,vector<int>(cols));
        for(int i=0;i<rows;i++){
            for(int j=0;j<cols;j++){
                dist[i][j]=1e9;
            }
        }

        dist[0][0]=grid[0][0];
        pq.push({0,{0,0}});
        while(pq.size()){
            auto [d,cord]=pq.top();
            auto [x,y]=cord;
            pq.pop();
            if(d>dist[x][y])continue;
            
            
            rigel(x,y-1,d,grid);//left cell
            rigel(x,y+1,d,grid);//right cell
            rigel(x-1,y,d,grid);//upper cell
            rigel(x+1,y,d,grid);//lower cell
        }
        return dist[rows-1][cols-1];
    }
};