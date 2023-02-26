CREATE USER IF NOT EXISTS 'pool_payout' @'%';
CREATE USER IF NOT EXISTS 'pool_service' @'%';
CREATE USER IF NOT EXISTS 'pool_server' @'%';
CREATE USER IF NOT EXISTS 'pool_api' @'%';
CREATE USER IF NOT EXISTS 'pool_info' @'%';
GRANT SELECT,
    INSERT ON pool.user TO 'pool_server' @'%';
GRANT SELECT ON pool.user TO 'pool_service' @'%';
GRANT SELECT ON pool.user TO 'pool_payout' @'%';
GRANT SELECT ON pool.user TO 'pool_info' @'%';
GRANT SELECT ON pool.user TO 'pool_api' @'%';
GRANT SELECT,
    INSERT ON pool.block TO 'pool_server' @'%';
GRANT SELECT,
    INSERT,
    UPDATE ON pool.block TO 'pool_service' @'%';
GRANT SELECT ON pool.block TO 'pool_payout' @'%';
GRANT SELECT ON pool.block TO 'pool_info' @'%';
GRANT SELECT ON pool.block TO 'pool_api' @'%';
GRANT SELECT,
    INSERT,
    UPDATE ON pool.shares TO 'pool_server' @'%';
GRANT SELECT,
    DELETE ON pool.shares TO 'pool_service' @'%';
GRANT SELECT ON pool.shares TO 'pool_api' @'%';
GRANT SELECT ON pool.shares TO 'pool_info' @'%';
GRANT SELECT ON pool.payin TO 'pool_server' @'%';
GRANT SELECT,
    INSERT,
    DELETE ON pool.payin TO 'pool_service' @'%';
GRANT SELECT ON pool.payin TO 'pool_payout' @'%';
GRANT SELECT ON pool.payin TO 'pool_info' @'%';
GRANT SELECT ON pool.payin TO 'pool_api' @'%';
GRANT SELECT ON pool.payout TO 'pool_server' @'%';
GRANT SELECT,
    INSERT ON pool.payout TO 'pool_service' @'%';
GRANT SELECT,
    INSERT ON pool.payout TO 'pool_payout' @'%';
GRANT SELECT ON pool.payout TO 'pool_info' @'%';
GRANT SELECT ON pool.payout TO 'pool_api' @'%';
GRANT SELECT,
    INSERT,
    DELETE ON pool.payout_request TO 'pool_server' @'%';
GRANT SELECT,
    DELETE ON pool.payout_request TO 'pool_payout' @'%';
GRANT SELECT ON pool.payout_request TO 'pool_info' @'%';
GRANT EXECUTE ON pool.* TO 'pool_server' @'%';
GRANT EXECUTE ON pool.* TO 'pool_service' @'%';
