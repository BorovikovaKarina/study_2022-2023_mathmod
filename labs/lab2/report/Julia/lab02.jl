using Plots

"Pасстояние на момент начала движения по спирали, случай 1"
const r_01 = 77/43

"Pасстояние на момент начала движения по спирали, случай 2"
const r_02 = -77/23

"Расстояние вначале"
const a = 7.7

"С для случая 1"
const C_01 = 77/43

"С для случая 2"
const C_02 = 77/(23*exp(-π/sqrt(9.89)))


function r(θ)
    return C_02*exp(θ / sqrt(9.89))
end

Θ = range(-π, 2π, 1000)

R = r.(Θ)


plt = plot(
  proj = :polar,
  aspect_ratio=:equal,
  dpi=300,
  title="Задача преследования",
  legend=true)


plot!(
  plt,
  Θ,
  R,
  xlabel="θ",
  ylabel="r(t)",
  label="Траектория катера",
  color=:green)

plot!(
  plt,
  [0.0,0.0],
  [r_02,7.7],
  color=:green,
  label="")

 
plot!(
  plt,
  [0.0,Θ[300]],
  [0,20],
  xlabel="θ",
  ylabel="r(t)",
  label="Траектория лодки с бандитами",
  color=:red)

plot!(
  [Θ[300]],
  [R[300]],
  seriestype=:scatter,
  label="Точка встречи"
) 

savefig(plt, "lab02.png")