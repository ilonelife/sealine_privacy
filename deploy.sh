#!/bin/bash

# Sealine 개인정보처리방침 Vercel 배포 스크립트

echo "🚀 Sealine 개인정보처리방침 배포를 시작합니다..."

# 현재 디렉토리 확인
if [ ! -f "index.html" ]; then
    echo "❌ index.html 파일을 찾을 수 없습니다. privacy-policy 디렉토리에서 실행해주세요."
    exit 1
fi

# Vercel CLI 설치 확인
if ! command -v vercel &> /dev/null; then
    echo "📦 Vercel CLI를 설치합니다..."
    npm install -g vercel
fi

# 의존성 설치 (개발용)
if [ ! -d "node_modules" ]; then
    echo "📦 의존성을 설치합니다..."
    npm install
fi

# HTML 파일 유효성 간단 체크
echo "🔍 HTML 파일을 검증합니다..."
if ! grep -q "<!DOCTYPE html>" index.html; then
    echo "⚠️ HTML 파일 형식에 문제가 있을 수 있습니다."
fi

# 배포 실행
echo "🌐 Vercel에 배포합니다..."
vercel --prod

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 배포가 완료되었습니다!"
    echo ""
    echo "📋 다음 단계:"
    echo "1. Vercel 대시보드에서 도메인을 확인하세요"
    echo "2. 앱 스토어 등록 시 개인정보처리방침 URL을 입력하세요"
    echo "3. 앱 내 설정에서 개인정보처리방침 링크를 업데이트하세요"
    echo ""
    echo "🔗 일반적인 URL 형식:"
    echo "   https://your-project-name.vercel.app/"
    echo ""
else
    echo "❌ 배포 중 오류가 발생했습니다."
    exit 1
fi