#-------------------------------------------------------------------------------
# Copyright (c) 2012 University of Illinois, NCSA.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the 
# University of Illinois/NCSA Open Source License
# which accompanies this distribution, and is available at
# http://opensource.ncsa.illinois.edu/license.html
#-------------------------------------------------------------------------------
context("Testing utility functions")

test_that("get.id works on some tables, and with different inputs", {
  con <- check_db_test()
  pftid <- get.id("pfts", "name", "salix", con)
  expect_true(is.numeric(pftid))
  
  pftname <- 'ebifarm.salix'
  modeltypeid <- 1
  pftid <- get.id("pfts", c("name", "modeltype_id"), c(pftname, modeltypeid), con)
  pft <- db.query(paste0("select name, modeltype_id from pfts where id = ", pftid), con)
  expect_equal(pft$name, pftname)
  # `as.numeric` here because of `integer64` type mismatch
  expect_equal(as.numeric(pft$modeltype_id), modeltypeid)
  try(db.close(con))
})
