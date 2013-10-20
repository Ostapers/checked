open Ocamlbuild_plugin;;
open Command;;

dispatch begin function
 | After_rules ->

   flag ["compile";  "ocaml"; "use_checked"] (S[A "-I"; A"lib"; A"checked.cma"]);
   flag ["ocamldep"; "ocaml"; "use_pa_checked"] 
     (S [A"-syntax";A"camlp5o"; A"-ppopt";A"pr_o.cmo"; A"-ppopt";P"./pa_checked.cmo"(*;
	     A"-I";A logger_inc *)]); 
   
   flag ["compile";  "ocaml"; "use_pa_checked"]
     (S[A "-syntax";A"camlp5o"
	   ;A "-ppopt"; P "./pa_checked.cmo"
	   ;A"-ppopt"; A"pr_o.cmo"
	   ]);
   flag ["link"; "byte"; "ocaml"; "use_checked"] (A"lib/checked.cma");
   flag ["link"; "byte"; "ocaml"]
     (S[A"-package"; A"typeutil"
	   ]);
   ocaml_lib "lib/checked"
 | _ -> ()
 end
