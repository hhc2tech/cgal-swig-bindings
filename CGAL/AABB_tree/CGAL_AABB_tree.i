%module CGAL_AABB_tree

%include "../common.i"
%import  "../Common/Macros.h"
%import  "../Kernel/Point_3.h"
%import  "../Kernel/Triangle_3.h"
%import  "../Kernel/Segment_3.h"
%import  "../Kernel/CGAL_Object.h"
%import  "../Polyhedron_3/Polyhedron_3.h"
%import  "../Polyhedron_3/polyhedron_3_handles.h"
%include "../Common/Input_iterator.h"
%include "../Common/Optional.h"


//include files
%{
  #include <CGAL/AABB_tree.h>
  #include <CGAL/AABB_traits.h>
  #include  "../Kernel/typedefs.h"
  #include  "../Kernel/Point_3.h"
  #include  "../Kernel/Triangle_3.h"
  #include  "../Kernel/Segment_3.h"
  #include  "../Polyhedron_3/Polyhedron_3.h"
  #include  "../Polyhedron_3/polyhedron_3_handles.h"
  #include "AABB_tree.h"
%}


%include "config.i"

//symbols to be defined (for python): experimental
//~ typedef CGAL_Facet_handle<Polyhedron_3_> Poly_3_Facet_handle;

//definitions
%include "AABB_tree.h"

%pragma(java) jniclassimports=%{
  import CGAL.Kernel.Triangle_3; import CGAL.Kernel.Segment_3; import CGAL.Kernel.Plane_3; import CGAL.Kernel.Point_3; import CGAL.Kernel.CGAL_Object;
  import CGAL.Polyhedron_3.Polyhedron_3_Halfedge_handle; import CGAL.Polyhedron_3.Polyhedron_3_Facet_handle; import java.util.Iterator; import java.util.Collection;
%}

%include "std_pair.i"
//Point_and_primitive_id
%typemap(javaimports)       std::pair<Point_3,Polyhedron_3_Facet_handle> %{import CGAL.Kernel.Point_3; import CGAL.Polyhedron_3.Polyhedron_3_Facet_handle;%}
%template(Point_and_Polyhedron_3_Facet_handle) std::pair<Point_3,Polyhedron_3_Facet_handle>;
%typemap(javaimports)       std::pair<Point_3,Polyhedron_3_Halfedge_handle> %{import CGAL.Kernel.Point_3; import CGAL.Polyhedron_3.Polyhedron_3_Halfedge_handle;%}
%template(Point_and_Polyhedron_3_Halfedge_handle) std::pair<Point_3,Polyhedron_3_Halfedge_handle>;
//CGAL_Object_and_primitive_id
%typemap(javaimports)       std::pair<CGAL_Object,Polyhedron_3_Facet_handle> %{import CGAL.Kernel.CGAL_Object; import CGAL.Polyhedron_3.Polyhedron_3_Facet_handle;%}
%template(Object_and_Polyhedron_3_Facet_handle) std::pair<CGAL_Object,Polyhedron_3_Facet_handle>;
%typemap(javaimports)       std::pair<CGAL_Object,Polyhedron_3_Halfedge_handle> %{import CGAL.Kernel.CGAL_Object; import CGAL.Polyhedron_3.Polyhedron_3_Halfedge_handle;%}
%template(Object_and_Polyhedron_3_Halfedge_handle) std::pair<CGAL_Object,Polyhedron_3_Halfedge_handle>;
//Optional<primitive_id>
%typemap(javaimports)       Optional<Polyhedron_3_Halfedge_handle> %{import CGAL.Polyhedron_3.Polyhedron_3_Halfedge_handle;%}
%template (Optional_Polyhedron_3_Halfedge_handle) Optional<Polyhedron_3_Halfedge_handle>;
%typemap(javaimports)       Optional<Polyhedron_3_Facet_handle> %{import CGAL.Polyhedron_3.Polyhedron_3_Facet_handle;%}
%template (Optional_Polyhedron_3_Facet_handle) Optional<Polyhedron_3_Facet_handle>;
//Optional<CGAL_Object_and_primitive_id>
%template (Optional_Object_and_Polyhedron_3_Halfedge_handle) Optional< std::pair<CGAL_Object,Polyhedron_3_Halfedge_handle> >;
%template (Optional_Object_and_Polyhedron_3_Facet_handle)    Optional< std::pair<CGAL_Object,Polyhedron_3_Facet_handle> >;


//~ Typemap_for_Input_iterator(Primitive_iterator_helper< Polyhedron_3_Facet_handle >::input,Polyhedron_3_Facet_handle,Polyhedron_3_Facet_handle::cpp_base,SWIGTYPE_p_CGAL_Facet_handleT_CGAL__Polyhedron_3T_EPIC_Kernel_CGAL__Polyhedron_items_with_id_and_info_3T_JavaData_t_t_t,"(LCGAL/Polyhedron_3/Polyhedron_3_Facet_handle;)J",insert_range)
Typemap_for_Input_iterator(Primitive_iterator_helper< Polyhedron_3_Facet_handle >::input,Polyhedron_3_Facet_handle,Polyhedron_3_Facet_handle::cpp_base,SWIGTYPE_p_CGAL_Facet_handleT_Polyhedron_3__t,"(LCGAL/Polyhedron_3/Polyhedron_3_Facet_handle;)J",rebuild)
Typemap_for_Input_iterator(Primitive_iterator_helper< Polyhedron_3_Halfedge_handle >::input,Polyhedron_3_Halfedge_handle,Polyhedron_3_Halfedge_handle::cpp_base,SWIGTYPE_p_CGAL_Halfedge_handleT_Polyhedron_3__t,"(LCGAL/Polyhedron_3/Polyhedron_3_Halfedge_handle;)J",rebuild)
#ifdef SWIGPYTHON
Typemap_for_Input_iterator_additional_function(AABB_tree_wrapper::AABB_tree_wrapper)
#endif
Typemap_for_Input_iterator(Point_range,Point_3,Point_3::cpp_base,SWIGTYPE_p_Point_3,"(LCGAL/Kernel/Point_3;)J",accelerate_distance_queries)

//intersected primitive output iterator
%define Polyhedron_3_Facet_output_iterator Primitive_iterator_helper<Polyhedron_3_Facet_handle>::output %enddef
Typemap_for_Output_iterator(Polyhedron_3_Facet_output_iterator,Polyhedron_3_Facet_handle,Polyhedron_3_Facet_handle::cpp_base,SWIGTYPE_p_CGAL_Facet_handleT_Polyhedron_3__t,"LCGAL/Polyhedron_3/Polyhedron_3_Facet_handle;")
%define Polyhedron_3_Halfedge_output_iterator Primitive_iterator_helper<Polyhedron_3_Halfedge_handle>::output %enddef
Typemap_for_Output_iterator(Polyhedron_3_Halfedge_output_iterator,Polyhedron_3_Halfedge_handle,Polyhedron_3_Halfedge_handle::cpp_base,SWIGTYPE_p_CGAL_Halfedge_handleT_Polyhedron_3__t,"LCGAL/Polyhedron_3/Polyhedron_3_Halfedge_handle;")

//intersection output iterator
%define Polyhedron_3_Facet_output_iterator_2 Primitive_iterator_helper<Polyhedron_3_Facet_handle>::output2 %enddef
%{ typedef std::pair<CGAL_Object,Polyhedron_3_Facet_handle> Object_and_Polyhedron_3_Facet_handle; %}
%define Object_and_Polyhedron_3_Facet_handle_base std::pair<CGAL::Object,Polyhedron_3_Facet_handle::cpp_base> %enddef
Typemap_for_Output_iterator(Polyhedron_3_Facet_output_iterator_2,Object_and_Polyhedron_3_Facet_handle,Object_and_Polyhedron_3_Facet_handle_base,SWIGTYPE_p_std__pairT_CGAL_Object_Polyhedron_3_Facet_handle_t,"LCGAL/AABB_tree/Object_and_Polyhedron_3_Facet_handle;")

%define Polyhedron_3_Halfedge_output_iterator_2 Primitive_iterator_helper<Polyhedron_3_Halfedge_handle>::output2 %enddef
%{ typedef std::pair<CGAL_Object,Polyhedron_3_Halfedge_handle> Object_and_Polyhedron_3_Halfedge_handle; %}
%define Object_and_Polyhedron_3_Halfedge_handle_base std::pair<CGAL::Object,Polyhedron_3_Halfedge_handle::cpp_base> %enddef
Typemap_for_Output_iterator(Polyhedron_3_Halfedge_output_iterator_2,Object_and_Polyhedron_3_Halfedge_handle,Object_and_Polyhedron_3_Halfedge_handle_base,SWIGTYPE_p_std__pairT_CGAL_Object_Polyhedron_3_Halfedge_handle_t,"LCGAL/AABB_tree/Object_and_Polyhedron_3_Halfedge_handle;")



%typemap(javaimports)      AABB_tree_wrapper%{import CGAL.Kernel.Triangle_3; import CGAL.Kernel.Segment_3; import CGAL.Kernel.Plane_3; import CGAL.Kernel.Point_3; import CGAL.Polyhedron_3.Polyhedron_3_Facet_handle; import java.util.Iterator; import java.util.Collection;%}
%template (AABB_tree_Polyhedron_3_Facet) AABB_tree_wrapper<CGAL_PTP_Tree,Polyhedron_3_Facet_handle,Polyhedron_3_Facet_handle>;

%typemap(javaimports)      AABB_tree_wrapper%{import CGAL.Kernel.Triangle_3; import CGAL.Kernel.Segment_3; import CGAL.Kernel.Plane_3; import CGAL.Kernel.Point_3; import CGAL.Polyhedron_3.Polyhedron_3_Halfedge_handle; import java.util.Iterator; import java.util.Collection;%}
%template (AABB_tree_Polyhedron_3_Halfedge) AABB_tree_wrapper<CGAL_PSP_Tree,Polyhedron_3_Halfedge_handle,Polyhedron_3_Halfedge_handle>;


