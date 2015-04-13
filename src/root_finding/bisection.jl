using ValidatedNumerics

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
