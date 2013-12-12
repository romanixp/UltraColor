// Fig. 19.3: PruebaCollection.java
// Uso de la interfaz Collection.
import java.util.List;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

public class PruebaCollection 
{
   private static final String[] colores = 
      { "MAGENTA", "ROJO", "BLANCO", "AZUL", "CYAN" };
   private static final String[] eliminarColores = 
      { "ROJO", "BLANCO", "AZUL" };

   // crea objeto ArrayList, le agrega los colores y lo manipula
   public PruebaCollection()
   {
      List< String > lista = new ArrayList< String >();      
      List< String > eliminarLista = new ArrayList< String >();

      // agrega los elementos en el arreglo colores a la lista
      for ( String color : colores )
         lista.add( color );       

      // agrega los elementos en eliminarColores a eliminarLista
      for ( String color : eliminarColores )
         eliminarLista.add( color ); 

      System.out.println( "ArrayList: " );

      // imprime en pantalla el contenido de la lista
      for ( int cuenta = 0; cuenta < lista.size(); cuenta++ )
         System.out.printf( "%s ", lista.get( cuenta ) );

      // elimina los colores contenidos en eliminarLista
      eliminarColores( lista, eliminarLista );

      System.out.println( "\n\nArrayList despues de llamar a eliminarColores: " );

      // imprime en pantalla el contenido de la lista
      for ( String color : lista )
         System.out.printf( "%s ", color );
   } // fin del constructor de PruebaCollection

   // elimina de coleccion1 los colores especificados en coleccion2
   private void eliminarColores( 
      Collection< String > coleccion1, Collection< String > coleccion2 )
   {
      // obtiene el iterador
      Iterator< String > iterador = coleccion1.iterator(); 

      // itera mientras la colecci�n tenga elementos
      while ( iterador.hasNext() )         

         if ( coleccion2.contains( iterador.next() ) )
            iterador.remove(); // elimina el color actual
   } // fin del m�todo eliminarColores

   public static void main( String args[] )
   {
      new PruebaCollection();
   } // fin de main
} // fin de la clase PruebaCollection

/**************************************************************************
 * (C) Copyright 1992-2007 por Deitel & Associates, Inc. y                *
 * Pearson Education, Inc. Todos los derechos reservados.                 *
 *                                                                        *
 * RENUNCIA: Los autores y el editor de este libro han realizado su mejor *
 * esfuerzo para preparar este libro. Esto incluye el desarrollo, la      *
 * investigaci�n y prueba de las teor�as y programas para determinar su   *
 * efectividad. Los autores y el editor no hacen ninguna garant�a de      *
 * ning�n tipo, expresa o impl�cita, en relaci�n con estos programas o    *
 * con la documentaci�n contenida en estos libros. Los autores y el       *
 * editor no ser�n responsables en ning�n caso por los da�os consecuentes *
 * en conexi�n con, o que surjan de, el suministro, desempe�o o uso de    *
 * estos programas.                                                       *
 *************************************************************************/
