type algebraic_term = Var of string | Fun of string * (algebraic_term list)

let system_to_equation x = 
	let make_fun_name lhs_list rhs_list = 
		let name_from_list l =
			let rec get_all_functions_names t = 
				match t with
					| Var x -> ""
					| Fun (name, l) -> name ^ (List.fold_left f "" l)
			and f all_prev_names term = 
				all_prev_names ^ (get_all_functions_names term)
			in
			List.fold_left f "" l
		in
		(name_from_list lhs_list) ^ (name_from_list rhs_list)
	in
	let (lhs_list, rhs_list) = List.split x in
	let fresh_name = make_fun_name lhs_list rhs_list in
	let fresh_name = "super_fresh_name_" ^ fresh_name in
	(Fun(fresh_name, lhs_list), Fun(fresh_name, rhs_list));;

let apply_substitution x y = failwith "Not implemented";;
let check_solution x y = failwith "Not implemented";;
let solve_system x = failwith "Not implemented";;
