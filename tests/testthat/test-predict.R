context("Testing predict methods")


test_that("predict methods", {
    x <- c(seq.int(0, 10, 0.5), NA)
    bsMat <- bSpline(x)
    ibsMat <- ibs(x)
    dbsMat <- dbs(x)
    msMat <- mSpline(x)
    isMat <- iSpline(x)
    csMat <- cSpline(x)
    expect_equivalent(predict(bsMat, 1), bsMat[3L, , drop = FALSE])
    expect_equivalent(predict(ibsMat, 1), ibsMat[3L, , drop = FALSE])
    expect_equivalent(predict(dbsMat, 1), dbsMat[3L, , drop = FALSE])
    expect_equivalent(predict(msMat, 1), msMat[3L, , drop = FALSE])
    expect_equivalent(predict(isMat, 1), isMat[3L, , drop = FALSE])
    expect_equivalent(predict(csMat, 1), csMat[3L, , drop = FALSE])
})
