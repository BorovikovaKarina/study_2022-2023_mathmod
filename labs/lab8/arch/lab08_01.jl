begin
	using Plots
	using DifferentialEquations
	
	"Оборотные средства предприятия для 1 фирмы"
	const M10 = 4.2 * 1000000
	"Оборотные средства предприятия для 1 фирмы"
	const M20 = 3.8 * 1000000
	"Критическая стоимость продуктв"
	const pcr = 11.4 * 1000
	"Число потребителей производимого продукта"
	const N = 26 * 1000
	"максимальная потребность одного человека в продукте в единицу времени"
	const q = 1

	"Длительность производительного цикла фирмы 1"
	const τ1 = 14
	"Длительность производительного цикла фирмы 2"
	const τ2 = 22
	
	"Себестоимость товаров в первой фирме"
	const p1 = 6.6 * 1000
	"Себестоимость товаров во второй фирме"
	const p2 = 4.5 * 1000
	
	const a1 = pcr / (τ1^2 * p2^2 * N * q)
	const a2 = pcr / (τ2^2 * p2^2 * N * q)
	const b = pcr / (τ1^2 * p1^2 * τ2^2 * p2^2 * N * q)
	const c1 = (pcr - p1) / (τ1 * p1)
	const c2 = (pcr - p2) / (τ2 * p2)
	
	"Начальные условия: u₀[1] - M¹₀, u₀[2] - M²₀"
	u0 = [M10, M20]

	"Период времени"
	T = (0.0, c1*300)

	function F!(du, u, p, t)
		du[1] = u[1] - (b/c1) * u[1] * u[2] - (a1/c1) * u[1]^2
		du[2] = (c2/c1) * u[2] - (b/c1) * u[1] * u[2] - (a2/c1) * u[2]^2
	end


	prob = ODEProblem(F!, u0, T)
	sol = solve(prob, dtmax=c1*5)


	const M1 = []
	const M2 = []

    for u in sol.u
		m1, m2 = u
		push!(M1, m1)
		push!(M2, m2)
	end

	time = sol.t
		
	for i in 1:length(time)
		time[i] /= c1
	end

	plt = plot(
		dpi = 300,
		size = (800, 600),
		title = "Модель конкуренции фирм"
	)

	plot!(
		plt,
		time,
		M1,
		color = :green,
		xlabel="t/c1",
		ylabel="M1(t), M2(t)",
        label= "Оборотные средства предприятия №1"
	)
	
	plot!(
		plt,
		time,
		M2,
		color = :purple,
		xlabel="t/c1",
		ylabel="M1(t), M2(t)",
        label= "Оборотные средства предприятия №1"
	)
	savefig(plt, "lab08_julia_1.png")
end


	