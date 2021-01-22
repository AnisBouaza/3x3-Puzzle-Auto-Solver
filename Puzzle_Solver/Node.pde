public class Node implements Comparable<Node>
{
  int[][] mat = new int[3][3];
  int cout,F;
  Node pere;
  
  Node()
  {
      for(int i = 0; i< taille_grille[0]; i++)
        {
         for( int j = 0; j<taille_grille[1]; j++)
         {
              mat[i][j]=0;
         }
         
        }
        
       cout = 1;
       F = 0;
       pere = null;
    
  }
  
  
 @Override
  public int compareTo(Node other)
  {
      return this.F - other.F;
  }
  
  
  @Override
  public boolean equals(Object o)
  {
    if(this == o)
      return true;
    if(o == null)
      return false;

    Node n = (Node) o;
    return !MatDif(this.mat,n.mat);
  }
}
