setGeneric("vunit_measure", function(object,...)standardGeneric("vunit_measure"))

setMethod(
  "vunit_measure",
  signature=signature(object="spatPomp"),
  definition=function (object, x, unit, time, params, Np=1, log=FALSE, gnsi = TRUE){
    pompLoad(object)
    storage.mode(x) <- "double"
    storage.mode(params) <- "double"
    out <- .Call('do_theta_to_v',
          object=object,
          X=x,
          Np = as.integer(Np),
          times=time,
          params=params,
          gnsi=gnsi)
    pompUnload(object)
    out[unit,,,drop=FALSE]
  }
)