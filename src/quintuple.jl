#=
   follows Algorithm A.8 
   in Mixed Precision Iterative Methods using High Precision Arithmetic
   by Hidehiko Hasegawa, 2013
=#

function renormalizeAs4{T<:StdFloat}(a0::T,a1::T,a2::T,a3::T,a4::T)
   s,t3 = eftSumGTE(a3,a4)
   s,t2 = eftSumGTE(a2,s)
   s,t1 = eftSumGTE(a1,s)
   b0,t0 = eftSumGTE(a0,s)
   
   s,t2 = eftSumGTE(t2,t3)
   s,t1 = eftSumGTE(t1,s)
   b1,t0 = eftSumGTE(t0,s)
   s,t1 = eftSumGTE(t1,t2)
   b0,t0 = eftSumGTE(t0,s)
   b3 = t0+t1
   
   b0,b1,b2,b3
end
