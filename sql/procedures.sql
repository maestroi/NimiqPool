DELIMITER //

CREATE PROCEDURE pool.StoreUserId(IN address VARCHAR(64), OUT user_id INTEGER)
SQL SECURITY INVOKER
BEGIN
    SELECT id INTO user_id FROM user WHERE user.address = address;
    IF ISNULL(user_id) THEN
        INSERT IGNORE INTO user (address) VALUES (address);
        SELECT id INTO user_id FROM user WHERE user.address = address;
    END IF;
END //

CREATE PROCEDURE pool.GetStoreUserId(IN address VARCHAR(64))
SQL SECURITY INVOKER
BEGIN
    CALL pool.StoreUserId(address, @user_id);
    SELECT @user_id AS id;
END //

CREATE PROCEDURE pool.StoreBlockId(IN hash BINARY(32), IN height INTEGER, IN datetime INTEGER, OUT block_id INTEGER)
SQL SECURITY INVOKER
BEGIN
    SELECT id INTO block_id FROM block WHERE block.hash = hash;
    IF ISNULL(block_id) THEN
        INSERT IGNORE INTO block (hash, height, datetime) VALUES (hash, height, datetime);
        SELECT id INTO block_id FROM block WHERE block.hash = hash;
    END IF;
END //

CREATE PROCEDURE pool.GetStoreBlockId(IN hash BINARY(32), IN height INTEGER, IN datetime INTEGER)
SQL SECURITY INVOKER
BEGIN
    CALL pool.StoreBlockId(hash, height,datetime, @block_id);
    SELECT @block_id AS id;
END //

DELIMITER ;
