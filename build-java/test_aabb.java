import CGAL.Kernel.Point_3;
import CGAL.Kernel.Plane_3;
import CGAL.Kernel.Segment_3;
import CGAL.Polyhedron_3.Polyhedron_3;
import CGAL.Polyhedron_3.Polyhedron_3_Facet_handle;
import CGAL.Polyhedron_3.Polyhedron_3_Halfedge_handle;
import CGAL.AABB_tree.AABB_tree_Polyhedron_3_Facet;
import CGAL.AABB_tree.AABB_tree_Polyhedron_3_Halfedge;
import CGAL.AABB_tree.Point_and_Polyhedron_3_Halfedge_handle;
import CGAL.AABB_tree.Optional_Polyhedron_3_Facet_handle;
import CGAL.AABB_tree.Optional_Object_and_Polyhedron_3_Facet_handle;
import CGAL.AABB_tree.Object_and_Polyhedron_3_Facet_handle;
import CGAL.AABB_tree.Object_and_Polyhedron_3_Halfedge_handle;
import CGAL.Kernel.CGAL_Object;
import CGAL.Kernel.CGAL_Kernel;

import java.util.LinkedList;

public class test_aabb {
  public static void main(String arg[]){
    System.loadLibrary("CGAL_AABB_tree");
    System.loadLibrary("CGAL_Polyhedron_3");
    Polyhedron_3 poly=new Polyhedron_3();
    poly.make_tetrahedron(new Point_3(0,0,0),new Point_3(1,0,0),new Point_3(0,1,0),new Point_3(0,0,1));
    
    AABB_tree_Polyhedron_3_Facet tree=new AABB_tree_Polyhedron_3_Facet(poly.facets());
    AABB_tree_Polyhedron_3_Halfedge tree2=new AABB_tree_Polyhedron_3_Halfedge(poly.edges());
    
    System.out.println(tree.size());
    System.out.println(tree2.size());
    
    Segment_3 s=new Segment_3(new Point_3(-0.5,-0.5,0.5),new Point_3(0.5,0.5,0.5));
    
    if (tree.do_intersect(s))
      System.out.println("OK");
    else
      System.out.println("oops");
    
    Segment_3 s2=new Segment_3(new Point_3(5,0,0.5),new Point_3(-5,0,0.5));

    if (tree2.do_intersect(s))
      System.out.println("OK");
    else
      System.out.println("oops");
    
    LinkedList<Polyhedron_3_Facet_handle> lst_fh = new LinkedList<Polyhedron_3_Facet_handle>();
    LinkedList<Polyhedron_3_Halfedge_handle> lst_hh = new LinkedList<Polyhedron_3_Halfedge_handle>();
    tree.all_intersected_primitives(s,lst_fh);
    tree2.all_intersected_primitives(s2,lst_hh);
    System.out.println(lst_fh.size());
    System.out.println(lst_hh.size());
    
    Point_and_Polyhedron_3_Halfedge_handle pair_phh=tree2.closest_point_and_primitive(new Point_3(5,0,0.5));
    
    Optional_Polyhedron_3_Facet_handle opt=tree.any_intersected_primitive(s);
    if (!opt.empty())
      System.out.println("OK");
    else
      System.out.println("oops");
    
    Segment_3 seg1=new Segment_3(new Point_3(-1,0,0),new Point_3(1,0,0));
    Segment_3 seg2=new Segment_3(new Point_3(0,1,0),new Point_3(0,-1,0));
    CGAL_Object obj=CGAL_Kernel.intersection(seg1,seg2);
    if (obj.is_Point_3())
      System.out.println(obj.get_Point_3());
    else
      System.out.println("oops");      
    
    Optional_Object_and_Polyhedron_3_Facet_handle opt_obj_fh=tree.any_intersection(s);
    if (!opt_obj_fh.empty())
    {
      Object_and_Polyhedron_3_Facet_handle opfh=opt_obj_fh.value();
      CGAL_Object obj1=opfh.getFirst();
      if ( obj1.is_Point_3() )
        System.out.println("OK");
      else
        System.out.println("oops");
    }
    else
      System.out.println("oops");
    
    LinkedList<Object_and_Polyhedron_3_Facet_handle> lst_ofh = new LinkedList<Object_and_Polyhedron_3_Facet_handle>();
    LinkedList<Object_and_Polyhedron_3_Halfedge_handle> lst_ohh = new LinkedList<Object_and_Polyhedron_3_Halfedge_handle>();
    
    tree.all_intersections(s,lst_ofh);
    tree2.all_intersections(s2,lst_ohh);
    
    if (lst_fh.size()==lst_ofh.size())
      System.out.println("OK");
    else
      System.out.println("oops");

    if (lst_hh.size()==lst_ohh.size())
      System.out.println("OK");
    else
      System.out.println("oops");
    LinkedList<Point_3> lst_pt=new LinkedList<Point_3>();
    lst_pt.add(new Point_3(0,0,0));
    lst_pt.add(new Point_3(0,1,0));
    tree.accelerate_distance_queries(lst_pt.iterator());
    
  }
  
}