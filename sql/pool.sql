CREATE DATABASE IF NOT EXISTS pool;
CREATE TABLE IF NOT EXISTS pool.user (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    address VARCHAR(64) NOT NULL UNIQUE
);
CREATE INDEX IF NOT EXISTS idx_user_address ON pool.user (address);
CREATE TABLE IF NOT EXISTS pool.block (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hash BINARY(32) NOT NULL UNIQUE,
    height INTEGER NOT NULL,
    datetime BIGINT NOT NULL,
    main_chain BOOLEAN NOT NULL DEFAULT false
);
CREATE INDEX IF NOT EXISTS idx_block_hash ON pool.block (hash);
CREATE INDEX IF NOT EXISTS idx_block_height ON pool.block (height);
CREATE TABLE IF NOT EXISTS pool.shares (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user INTEGER NOT NULL REFERENCES pool.user(id),
    device INTEGER UNSIGNED NOT NULL,
    prev_block INTEGER NOT NULL REFERENCES pool.block(id),
    count INTEGER NOT NULL,
    difficulty DOUBLE NOT NULL,
    deviceName VARCHAR(1000) DEFAULT NULL,
    UNIQUE(user, device, prev_block)
);
CREATE INDEX IF NOT EXISTS idx_share_prev ON pool.shares (prev_block);
CREATE TABLE IF NOT EXISTS pool.payin (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user INTEGER NOT NULL REFERENCES pool.user(id),
    amount DOUBLE NOT NULL,
    block INTEGER NOT NULL REFERENCES pool.block(id),
    UNIQUE(user, block)
);
CREATE TABLE IF NOT EXISTS pool.payout (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user INTEGER NOT NULL REFERENCES pool.user(id),
    amount DOUBLE NOT NULL,
    datetime BIGINT NOT NULL,
    transaction BINARY(32)
);
CREATE TABLE IF NOT EXISTS pool.payout_request (
    id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user INTEGER NOT NULL UNIQUE REFERENCES pool.user(id)
);
