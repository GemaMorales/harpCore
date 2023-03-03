# test functions for manipulating harp_df data frames and harp_list objects

## select_members
test_that("select_members selects the correct members", {
  expect_equal(
    select_members(ens_point_df, 0),
    ens_point_df[c("fcdate", "lead_time", "validdate", "SID", "point_mbr000")]
  )
  expect_equal(
    select_members(ens_grid_df, 1),
    ens_grid_df[c("fcdate", "lead_time", "validdate", "grid_mbr001")]
  )
  expect_equal(
    select_members(ens_point_list, 0),
    structure(
      list(
        a = ens_point_list[[1]][c("fcdate", "lead_time", "validdate", "SID", "point_mbr000")],
        b = ens_point_list[[2]][c("fcdate", "lead_time", "validdate", "SID", "point_mbr000")]
      ),
      class = c("harp_list", "list")
    )
  )
  expect_equal(
    suppressWarnings(select_members(ens_point_list, list(0, 1))),
    structure(
      list(
        a = ens_point_list[[1]][c("fcdate", "lead_time", "validdate", "SID", "point_mbr000")],
        b = ens_point_list[[2]][c("fcdate", "lead_time", "validdate", "SID", "point_mbr001")]
      ),
      class = c("harp_list", "list")
    )
  )
  expect_equal(
    select_members(ens_grid_list, list(a_fcst = 1, b_fcst = 0)),
    structure(
      list(
        a_fcst = ens_grid_list[[1]][c("fcdate", "lead_time", "validdate", "grid_mbr001")],
        b_fcst = ens_grid_list[[2]][c("fcdate", "lead_time", "validdate", "grid_mbr000")]
      ),
      class = c("harp_list", "list")
    )
  )
})

test_that("select_members throws error for wrong names in list", {
  expect_error(
    select_members(ens_grid_list, list(a = 0, b = 0)),
    "a, b not found in .data"
  )
  expect_error(
    select_members(ens_grid_list, list(a_fcst = 0, b = 0)),
    "b not found in .data"
  )
})

## pivot_members
test_that("pivot_members returns the correct data frame", {
  expect_equal(
    pivot_members(ens_point_df),
    structure(
      tibble::tibble(
        sub_model = "point",
        fcdate = rep(ens_point_df$fcdate, 2),
        lead_time = rep(sort(ens_point_df$lead_time), 2),
        validdate = rep(sort(ens_point_df$validdate), 2),
        SID = sort(rep(ens_point_df$SID, 2)),
        member = rep(c("mbr000", "mbr001"), nrow(ens_point_df)),
        forecast = unlist(lapply(
          1:nrow(ens_point_df),
          function(i) c(ens_point_df$point_mbr000[i], ens_point_df$point_mbr001[i])
        ))
      ),
      class = c("harp_ens_point_df_long", "harp_point_df", "harp_df", "tbl_df", "tbl", "data.frame")
    )
  )
  expect_equal(
    pivot_members(ens_grid_df),
    structure(
      tibble::tibble(
        sub_model = "grid",
        fcdate = rep(ens_grid_df$fcdate, 2),
        lead_time = sort(rep(ens_grid_df$lead_time, 2)),
        validdate = sort(rep(ens_grid_df$validdate, 2)),
        member = rep(c("mbr000", "mbr001"), nrow(ens_grid_df)),
        forecast = Reduce(c, lapply(
          1:nrow(ens_grid_df),
          function(i) c(ens_grid_df$grid_mbr000[i], ens_grid_df$grid_mbr001[i])
        ))
      ),
      class = c("harp_ens_grid_df_long", "harp_grid_df", "harp_df", "tbl_df", "tbl", "data.frame")
    )
  )
})

test_that("pivot_members works in both directions", {
  expect_equal(pivot_members(pivot_members(ens_point_df)), ens_point_df)
  expect_equal(pivot_members(pivot_members(ens_grid_df)), ens_grid_df)
})

## expand_date
test_that("expand_date expands the date correctly", {
  expect_equal(
    expand_date(det_point_df, validdate),
    structure(
        tibble::tibble(
        fcdate = det_point_df$fcdate,
        lead_time = det_point_df$lead_time,
        validdate = det_point_df$validdate,
        SID = det_point_df$SID,
        point_det = det_point_df$point_det,
        valid_year = 2021L,
        valid_month = 1L,
        valid_day = 1L,
        valid_hour = rep(seq.int(0, 23), 2),
        valid_minute = 0L
      ),
      class = class(det_point_df)
    )
  )
  expect_equal(
    expand_date(ens_point_df, fcdate),
    structure(
      tibble::tibble(
        fcdate = ens_point_df$fcdate,
        lead_time = ens_point_df$lead_time,
        validdate = ens_point_df$validdate,
        SID = ens_point_df$SID,
        point_mbr000 = ens_point_df$point_mbr000,
        point_mbr001 = ens_point_df$point_mbr001,
        fc_year = 2021L,
        fc_month = 1L,
        fc_day = 1L,
        fc_hour = 0L,
        fc_minute = 0L
      ),
      class = class(ens_point_df)
    )
  )
  expect_equal(
    expand_date(det_grid_df, fcdate, text_months = TRUE),
    structure(
      tibble::tibble(
        fcdate = det_grid_df$fcdate,
        lead_time = det_grid_df$lead_time,
        validdate = det_grid_df$validdate,
        grid_det = det_grid_df$grid_det,
        fc_year = 2021L,
        fc_month = "Jan",
        fc_day = 1L,
        fc_hour = 0L,
        fc_minute = 0L
      ),
      class = class(det_grid_df)
    )
  )
  expect_equal(
    expand_date(det_point_list, validdate),
    structure(
      list(
        a = structure(
          tibble::tibble(
            fcdate = det_point_list[[1]]$fcdate,
            lead_time = det_point_list[[1]]$lead_time,
            validdate = det_point_list[[1]]$validdate,
            SID = det_point_list[[1]]$SID,
            point_det = det_point_list[[1]]$point_det,
            valid_year = 2021L,
            valid_month = 1L,
            valid_day = 1L,
            valid_hour = rep(seq.int(0, 23), 2),
            valid_minute = 0L
          ),
          class = class(det_point_list[[1]])
        ),
        b = structure(
          tibble::tibble(
            fcdate = det_point_list[[2]]$fcdate,
            lead_time = det_point_list[[2]]$lead_time,
            validdate = det_point_list[[2]]$validdate,
            SID = det_point_list[[2]]$SID,
            point_det = det_point_list[[2]]$point_det,
            valid_year = 2021L,
            valid_month = 1L,
            valid_day = 1L,
            valid_hour = rep(seq.int(0, 23), 2),
            valid_minute = 0L
          ),
          class = class(det_point_list[[2]])
        )
      ),
      class = class(det_point_list)
    )
  )
})

test_that("expand_date throws warning for bad column selection", {
  expect_warning(
    expand_date(det_point_df, SID), "SID is not a date-time column"
  )
  expect_warning(
    expand_date(det_point_df, col), "col not found"
  )
})

