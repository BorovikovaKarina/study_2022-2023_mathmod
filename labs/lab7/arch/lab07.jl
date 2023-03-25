    using Plots
	using DifferentialEquations

	a = 0.7
	#a = 0.61
	#a = 0.000073
	b = 0.6
	#b = 0.000061
	#b = 0.000073 
	N = 1224
	n0 = 14
	t = (0.0, 0.05)
	#t = (0.0, 5.0)

	max = [0.0, 0.0, 0.0]
	
	function F!(dn, n, p, t)
		
		dn[1] = (a*t+b*cos(t)*n[1])*(N-n[1])

		#=if dn[1] > max[1]
			max[1] = dn[1]
			max[2] = n[1]
			max[3] = t
		end=#
	end
	

	prob = ODEProblem(F!, [n0], t)
	sol = solve(prob, saveat = 0.000001)

	plt = plot(
		dpi = 300,
		size = (800, 600),
		title = "Модель эффективности рекламы"
	)
	plot!(
		sol,
		color =:red, 
		xlabel = "t",
		ylabel = "Распространение рекламы",
		label = "Информированные клиенты"
	)

	#=scatter!(
		plt,
		[max[3]],
		[max[2]],
		label = "Максимальная скорость",
		ms = 1.5
	)=#
	#plot(sol)

	savefig(plt, "lab07_julia_3.png")
