# ビルド
FROM ghcr.io/rust-cross/cargo-zigbuild AS builder

WORKDIR /app
COPY . .

RUN --mount=type=cache,target=${WORKDIR}/target/ \
    --mount=type=cache,target=/usr/local/cargo/registry/

RUN cargo zigbuild --release --target x86_64-unknown-linux-gnu
RUN strip target/x86_64-unknown-linux-gnu/release/discord_utils -o discord_utils

# 実行
FROM gcr.io/distroless/cc-debian12:nonroot

COPY --from=builder /app/discord_utils /

USER nonroot

ENTRYPOINT ["/discord_utils"]
