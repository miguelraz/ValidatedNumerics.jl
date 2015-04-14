using ValidatedNumerics

include("automatic_differentiation.jl")

const tol = 1e-14

function bisection(f, x::Interval)

    image = f(x)

    if 0 ∉ image
        return []  # guaranteed that no zero in the interval
    end

    if diam(x) < tol
        return [x]
    end

    m = mid(x)

    return vcat(bisection(f, Interval(x.lo, m)), bisection(f, Interval(m, x.hi)))

end


function check_roots{T}(f, possible_roots::Vector{Interval{T}})
    for root in possible_roots
        deriv = differentiate(f, root)
        if 0 ∉ deriv
            println("Unique root in ", root)
        else
            println("Possible root in ", root)
        end
    end
end
